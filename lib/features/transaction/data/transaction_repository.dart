import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';
import 'package:fin_tamer/features/transaction/data/local/transaction_local_data_source.dart';
import 'package:fin_tamer/features/transaction/data/local/mappers/transaction_local_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/transaction/data/local/entities/transaction_entity.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';
import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/history/domain/interfaces/i_history_repository.dart';
import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/core/event_sourcing/sync_service.dart';

class TransactionRepository implements ITransactionRepository {
  final ITransactionRemoteDataSource remoteDataSource;
  final IAccountRepository accountRepository;
  final ICategoryRepository categoryRepository;
  final IHistoryRepository historyRepository;
  final TransactionLocalDataSource localDataSource;
  final SyncService syncService;

  TransactionRepository({
    required this.remoteDataSource,
    required this.accountRepository,
    required this.categoryRepository,
    required this.historyRepository,
    required this.localDataSource,
    required this.syncService,
  });

  @override
  Future<Transaction> create(TransactionCreateData data) async {
    try {
      final account = await accountRepository.getById(data.accountId);
      final category = await categoryRepository.getById(data.categoryId);
      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction');
        throw Exception('Account or Category not found for transaction');
      }
      final tempApiId = DateTime.now().millisecondsSinceEpoch * -1;

      final tempEntity = TransactionEntity(
        id: 0,
        apiId: tempApiId,
        accountId: account.id,
        accountApiId: account.apiId,
        categoryApiId: category.apiId,
        amount: data.amount.toString(),
        transactionDate: data.transactionDate.toUtc(),
        comment: data.comment,
        createdAt: DateTime.now().toUtc(),
        updatedAt: DateTime.now().toUtc(),
      );
      await localDataSource.save(tempEntity);

      final localId = tempEntity.id;

      final oldBalance = double.tryParse(account.balance) ?? 0.0;
      final amount = data.amount;
      final newBalance = category.isIncome ? oldBalance + amount : oldBalance - amount;
      await accountRepository.updateLocalBalance(account.id, newBalance);

      var request = TransactionRequestDto(
        accountId: tempEntity.accountApiId,
        categoryId: tempEntity.categoryApiId,
        amount: tempEntity.amount,
        transactionDate: tempEntity.transactionDate,
        comment: tempEntity.comment,
      );

      // Добавляем событие в event log с локальным id
      final event = SyncEvent(
        entityTypeIndex: EntityType.transaction.index,
        eventTypeIndex: EventType.create.index,
        entityId: localId.toString(),
        payloadJson: jsonEncode(request.toJson()),
        timestamp: DateTime.now().toUtc(),
      );
      syncService.addEvent(event);

      return tempEntity.toDomain(account: account.toBrief(), category: category);
    } catch (e, stack) {
      LoggerService.error('Error in create', e, stack);
      rethrow;
    }
  }

  @override
  Future<Transaction?> update(TransactionUpdateData data) async {
    try {
      final localEntity = await localDataSource.getById(data.id);
      if (localEntity == null) {
        LoggerService.error('Transaction not found for update: id=${data.id}');
        throw Exception('Transaction not found for update: id=${data.id}');
      }
      final account = await accountRepository.getById(data.accountId);
      final category = await categoryRepository.getById(data.categoryId);
      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction update');
        throw Exception('Account or Category not found for transaction update');
      }
      final oldAmount = double.tryParse(localEntity.amount) ?? 0.0;
      localEntity.accountApiId = account.apiId;
      localEntity.categoryApiId = category.apiId;
      localEntity.amount = data.amount.toString();
      localEntity.transactionDate = data.transactionDate.toUtc();
      localEntity.comment = data.comment;
      localEntity.updatedAt = DateTime.now().toUtc();
      await localDataSource.save(localEntity);
      final oldBalance = double.tryParse(account.balance) ?? 0.0;
      final revertedBalance = category.isIncome ? oldBalance - oldAmount : oldBalance + oldAmount;
      final newBalance = category.isIncome ? revertedBalance + data.amount : revertedBalance - data.amount;
      await accountRepository.updateLocalBalance(account.id, newBalance);
      var request = TransactionRequestDto(
        accountId: localEntity.accountApiId,
        categoryId: localEntity.categoryApiId,
        amount: localEntity.amount.toString(),
        transactionDate: localEntity.transactionDate,
        comment: localEntity.comment,
      );
      final event = SyncEvent(
        entityTypeIndex: EntityType.transaction.index,
        eventTypeIndex: EventType.update.index,
        entityId: localEntity.id.toString(),
        payloadJson: jsonEncode(request.toJson()),
        timestamp: DateTime.now().toUtc(),
      );
      syncService.addEvent(event);
      return localEntity.toDomain(account: account.toBrief(), category: category);
    } catch (e, stack) {
      LoggerService.error('Error in update', e, stack);
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      final localEntity = await localDataSource.getById(id);
      if (localEntity == null) {
        LoggerService.error('Transaction not found for delete: id=$id');
        throw Exception('Transaction not found for delete: id=$id');
      }
      final apiId = localEntity.apiId;
      localEntity.isDeleted = true;
      await localDataSource.save(localEntity);
      if (apiId > 0) {
        final event = SyncEvent(
          entityTypeIndex: EntityType.transaction.index,
          eventTypeIndex: EventType.delete.index,
          entityId: id.toString(),
          payloadJson: apiId.toString(),
          timestamp: DateTime.now().toUtc(),
        );
        syncService.addEvent(event);
      }
      final account = await accountRepository.getByApiId(localEntity.accountApiId);
      final category = await categoryRepository.getByApiId(localEntity.categoryApiId);
      if (account != null && category != null) {
        final oldBalance = double.tryParse(account.balance) ?? 0.0;
        final amount = double.tryParse(localEntity.amount) ?? 0.0;
        final newBalance = category.isIncome ? oldBalance - amount : oldBalance + amount;
        await accountRepository.updateLocalBalance(account.id, newBalance);
      }
    } catch (e, stack) {
      LoggerService.error('Error in delete', e, stack);
      rethrow;
    }
  }

  @override
  Future<Transaction?> getById(int id) async {
    try {
      await syncService.sync();
      final entity = await localDataSource.getById(id);
      if (entity == null) return null;

      final account = await accountRepository.getByApiId(entity.accountApiId);
      final category = await categoryRepository.getByApiId(entity.categoryApiId);

      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction getById: transactionId=$id');
        return null;
      }

      return entity.toDomain(account: account.toBrief(), category: category);
    } catch (e, stack) {
      LoggerService.error('Error in getById', e, stack);
      return null;
    }
  }

  Future<Transaction?> getByApiId(int apiId) async {
    try {
      await syncService.sync();
      final entity = await localDataSource.getByApiId(apiId);

      if (entity != null) {
        final account = await accountRepository.getByApiId(entity.accountApiId);
        final category = await categoryRepository.getByApiId(entity.categoryApiId);
        if (account == null || category == null) {
          LoggerService.error('Account or Category not found for transaction getByApiId: apiId=$apiId');
          return null;
        }
        return entity.toDomain(account: account.toBrief(), category: category);
      }

      final dto = await remoteDataSource.getById(apiId);
      if (dto == null) return null;
      final account = await accountRepository.getByApiId(dto.account.id);
      final category = await categoryRepository.getByApiId(dto.category.id);
      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction getByApiId (from remote): apiId=$apiId');
        return null;
      }

      final entityFromDto = dto.toEntity(account.id);

      await localDataSource.save(entityFromDto);

      return entityFromDto.toDomain(account: account.toBrief(), category: category);
    } catch (e, stack) {
      LoggerService.error('Error in getByApiId', e, stack);
      return null;
    }
  }

  @override
  Future<List<Transaction>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    try {
      final account = await accountRepository.getById(accountId);
      if (account == null) {
        LoggerService.error('Account not found: id=$accountId');
        return [];
      }

      try {
        return await _getByPeriodFetchRemote(account, startDate, endDate);
      } catch (e) {
        return await _getByPeriodOnlyLocal(account, startDate, endDate);
      }
    } catch (e, stack) {
      LoggerService.error('Error in getByPeriod', e, stack);
      return [];
    }
  }

  Future<List<Transaction>> _getByPeriodFetchRemote(Account account, DateTime startDate, DateTime endDate) async {
    final dtos = await remoteDataSource.getByPeriod(account.apiId, startDate, endDate);
    final existing = await localDataSource.getByAccount(account.apiId);
    // Не создаём новые, если есть локальные с таким apiId и isDeleted == true
    final existingApiIdsDeleted = existing.where((e) => e.isDeleted).map((e) => e.apiId).toSet();
    final existingApiIds = existing.map((e) => e.apiId).toSet();
    final List<TransactionEntity> newEntities = [];
    final newDtos = dtos.where((dto) => !existingApiIds.contains(dto.id) && !existingApiIdsDeleted.contains(dto.id)).toList();
    for (final dto in newDtos) {
      final account = await accountRepository.getByApiId(dto.account.id);
      final category = await categoryRepository.getByApiId(dto.category.id);
      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction: transactionApiId=${dto.id}');
        continue;
      }
      final entity = dto.toEntity(account!.id);
      newEntities.add(entity);
    }
    await localDataSource.saveAll(newEntities);
    final allEntities = [...existing, ...newEntities].where((e) => !e.isDeleted && e.transactionDate.isAfter(startDate) && e.transactionDate.isBefore(endDate)).toList();
    final List<Transaction> transactions = [];
    for (final entity in allEntities) {
      final account = await accountRepository.getByApiId(entity.accountApiId);
      final category = await categoryRepository.getByApiId(entity.categoryApiId);
      if (account == null || category == null) {
        LoggerService.error('Account or Category not found for transaction: transactionApiId=${entity.apiId}');
        continue;
      }
      transactions.add(entity.toDomain(account: account.toBrief(), category: category));
    }
    return transactions;
  }

  Future<List<Transaction>> _getByPeriodOnlyLocal(Account account, DateTime startDate, DateTime endDate) async {
    final localEntities = await localDataSource.getByAccount(account.apiId);
    final filtered = localEntities.where((e) => !e.isDeleted && e.transactionDate.isAfter(startDate) && e.transactionDate.isBefore(endDate)).toList();
    if (filtered.isNotEmpty) {
      final futures = filtered.map((entity) async {
        final account = await accountRepository.getByApiId(entity.accountApiId);
        final category = await categoryRepository.getByApiId(entity.categoryApiId);
        if (account == null || category == null) {
          LoggerService.error('Account or Category not found for transaction: transactionApiId= {entity.apiId}');
          return null;
        }
        return entity.toDomain(account: account.toBrief(), category: category);
      });
      final results = await Future.wait(futures);
      return results.whereType<Transaction>().toList();
    }

    return [];
  }
}
