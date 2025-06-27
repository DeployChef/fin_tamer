import 'package:fin_tamer/features/transaction/data/remote/mock_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';
import 'package:fin_tamer/features/transaction/data/remote/mappers/transaction_mapper.dart';
import 'package:fin_tamer/features/transaction/data/local/transaction_local_data_source.dart';
import 'package:fin_tamer/features/transaction/data/local/mappers/transaction_local_mapper.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/category/data/local/category_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/mappers/account_local_mapper.dart';
import 'package:fin_tamer/features/category/data/local/mappers/category_local_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/transaction/data/local/entities/transaction_entity.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';

class TransactionRepository implements ITransactionRepository {
  final MockTransactionRemoteDataSource remoteDataSource;
  final TransactionLocalDataSource localDataSource;
  final AccountLocalDataSource accountLocalDataSource;
  final CategoryLocalDataSource categoryLocalDataSource;

  TransactionRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.accountLocalDataSource,
    required this.categoryLocalDataSource,
  });

  @override
  Future<Transaction> create(TransactionCreateData data) async {
    final tempApiId = DateTime.now().millisecondsSinceEpoch * -1;
    final tempEntity = TransactionEntity(
      id: 0,
      apiId: tempApiId,
      accountApiId: data.accountId,
      categoryApiId: data.categoryId,
      amount: data.amount,
      transactionDate: data.transactionDate.toUtc(),
      comment: data.comment,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
    await localDataSource.save(tempEntity);

    final dto = await remoteDataSource.create(data.toDto());
    final entity = dto.toEntity();

    await localDataSource.delete(tempEntity.id);
    await localDataSource.save(entity);

    final accountEntity = await accountLocalDataSource.getByApiId(entity.accountApiId);
    final categoryEntity = await categoryLocalDataSource.getByApiId(entity.categoryApiId);
    if (accountEntity == null || categoryEntity == null) {
      //TODO обработка ошибок
      throw Exception('Account or Category not found for transaction');
    }
    final account = accountEntity.toBrief();
    final category = categoryEntity.toDomain();
    return entity.toDomain(account: account, category: category);
  }

  @override
  Future<Transaction?> update(TransactionUpdateData data) async {
    final localEntity = await localDataSource.getById(data.id);

    if (localEntity == null) {
      //TODO обработка ошибок
      return null;
    }

    final accountEntity = await accountLocalDataSource.getByApiId(data.accountId);
    final categoryEntity = await categoryLocalDataSource.getByApiId(data.categoryId);
    if (accountEntity == null || categoryEntity == null) {
      //TODO обработка ошибок
      return null;
    }

    localEntity.accountApiId = accountEntity.apiId;
    localEntity.categoryApiId = categoryEntity.apiId;
    localEntity.amount = data.amount;
    localEntity.transactionDate = data.transactionDate.toUtc();
    localEntity.comment = data.comment;
    localEntity.updatedAt = DateTime.now().toUtc();
    await localDataSource.save(localEntity);

    final account = accountEntity.toBrief();
    final category = categoryEntity.toDomain();
    return localEntity.toDomain(account: account, category: category);
  }

  @override
  Future<void> delete(int id) async {
    final localEntity = await localDataSource.getById(id);
    if (localEntity == null) {
      //TODO обработка ошибок
      return;
    }
    final apiId = localEntity.apiId;
    await localDataSource.delete(id);
    if (apiId > 0) {
      await remoteDataSource.delete(apiId);
    }
  }

  @override
  Future<Transaction?> getById(int id) async {
    final entity = await localDataSource.getById(id);
    if (entity == null) return null;

    final accountEntity = await accountLocalDataSource.getByApiId(entity.accountApiId);
    final categoryEntity = await categoryLocalDataSource.getByApiId(entity.categoryApiId);

    if (accountEntity == null || categoryEntity == null) {
      //TODO обработка ошибок
      return null;
    }

    final account = accountEntity.toBrief();
    final category = categoryEntity.toDomain();

    return entity.toDomain(account: account, category: category);
  }

  Future<Transaction?> getByApiId(int apiId) async {
    final entity = await localDataSource.getByApiId(apiId);

    if (entity != null) {
      final accountEntity = await accountLocalDataSource.getByApiId(entity.accountApiId);
      final categoryEntity = await categoryLocalDataSource.getByApiId(entity.categoryApiId);
      if (accountEntity == null || categoryEntity == null) {
        //TODO обработка ошибок
        return null;
      }
      final account = accountEntity.toBrief();
      final category = categoryEntity.toDomain();
      return entity.toDomain(account: account, category: category);
    }

    final dto = await remoteDataSource.getById(apiId);
    if (dto == null) return null;
    final entityFromDto = dto.toEntity();
    await localDataSource.save(entityFromDto);
    final accountEntity = await accountLocalDataSource.getByApiId(entityFromDto.accountApiId);
    final categoryEntity = await categoryLocalDataSource.getByApiId(entityFromDto.categoryApiId);
    if (accountEntity == null || categoryEntity == null) {
      //TODO обработка ошибок
      return null;
    }
    final account = accountEntity.toBrief();
    final category = categoryEntity.toDomain();
    return entityFromDto.toDomain(account: account, category: category);
  }

  @override
  Future<List<Transaction>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    final accountEntity = await accountLocalDataSource.getByApiId(accountId);
    if (accountEntity == null) {
      //TODO обработка ошибок
      throw Exception('Account not found');
    }

    final localEntities = await localDataSource.getByAccount(accountEntity.apiId);
    final filtered = localEntities.where((e) => e.transactionDate.isAfter(startDate) && e.transactionDate.isBefore(endDate)).toList();
    if (filtered.isNotEmpty) {
      return Future.wait(filtered.map((entity) async {
        final accountEntity = await accountLocalDataSource.getByApiId(entity.accountApiId);
        final categoryEntity = await categoryLocalDataSource.getByApiId(entity.categoryApiId);
        if (accountEntity == null || categoryEntity == null) {
          //TODO обработка ошибок
          throw Exception('Account or Category not found for transaction');
        }
        final category = categoryEntity.toDomain();
        final account = accountEntity.toDomain().toBrief();
        return entity.toDomain(account: account, category: category);
      }));
    }

    final dtos = await remoteDataSource.getByPeriod(accountEntity.apiId, startDate, endDate);
    final existing = await localDataSource.getByAccount(accountEntity.apiId);

    final existingApiIds = existing.map((e) => e.apiId).toSet();
    final newEntities = dtos.where((dto) => !existingApiIds.contains(dto.id)).map((dto) => dto.toEntity()).toList();

    await localDataSource.saveAll(newEntities);

    final allEntities = [...existing, ...newEntities].where((e) => e.transactionDate.isAfter(startDate) && e.transactionDate.isBefore(endDate)).toList();
    return Future.wait(allEntities.map((entity) async {
      final accountEntity = await accountLocalDataSource.getByApiId(entity.accountApiId);
      final categoryEntity = await categoryLocalDataSource.getByApiId(entity.categoryApiId);
      if (accountEntity == null || categoryEntity == null) {
        //TODO обработка ошибок
        throw Exception('Account or Category not found for transaction');
      }
      final category = categoryEntity.toDomain();
      final account = accountEntity.toDomain().toBrief();
      return entity.toDomain(account: account, category: category);
    }));
  }
}
