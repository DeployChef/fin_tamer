import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/mappers/account_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/mappers/account_local_mapper.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/local/mappers/stat_item_local_mapper.dart';
import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/core/event_sourcing/sync_service.dart';

class AccountRepository implements IAccountRepository {
  final IAccountRemoteDataSource remoteDataSource;
  final IAccountLocalDataSource localDataSource;
  final IStatItemLocalDataSource statItemLocalDataSource;
  final ISyncService syncService;

  AccountRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.statItemLocalDataSource,
    required this.syncService,
  });

  @override
  Future<List<Account>> getAll() async {
    final localEntities = await localDataSource.getAll();
    if (localEntities.isNotEmpty) {
      return Future.wait(localEntities.map((entity) async {
        final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
        final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
        return entity.toDomain(
          incomeStats: incomeStats,
          expenseStats: expenseStats,
        );
      }));
    }
    final dtos = await remoteDataSource.getAll();
    final accountEntities = dtos.map((e) => e.toEntity()).toList();
    await localDataSource.saveAll(accountEntities);
    return accountEntities.map((entity) => entity.toDomain()).toList();
  }

  @override
  Future<Account?> getById(int id) async {
    final entity = await localDataSource.getById(id);
    if (entity == null) {
      final accounts = await getAll();
      return accounts.firstOrNull?.toEntity().toDomain();
    }

    var incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
    var expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);

    if (incomeStats.isEmpty || expenseStats.isEmpty) {
      final dto = await remoteDataSource.getResponseById(entity.apiId);
      if (dto == null) return null;
      incomeStats = dto.incomeStats.map((statItem) => statItem.toEntity(accountApiId: dto.id, isIncome: true)).toList();
      expenseStats = dto.expenseStats.map((statItem) => statItem.toEntity(accountApiId: dto.id, isIncome: false)).toList();
      await statItemLocalDataSource.saveAll([...incomeStats, ...expenseStats]);
    }

    return entity.toDomain(
      incomeStats: incomeStats,
      expenseStats: expenseStats,
    );
  }

  @override
  Future<Account> create(AccountCreateData data) async {
    final dto = await remoteDataSource.create(data.toDto());
    final entity = dto.toEntity();
    await localDataSource.save(entity);
    final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
    final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
    return entity.toDomain(
      incomeStats: incomeStats,
      expenseStats: expenseStats,
    );
  }

  @override
  Future<Account?> update(AccountUpdateData data) async {
    var entity = await localDataSource.getById(data.id);
    if (entity == null) {
      throw Exception('Account not found for update: id=${data.id}');
    }
    entity.name = data.name;
    entity.balance = data.balance;
    entity.currency = data.currency;
    entity.updatedAt = DateTime.now().toUtc();
    await localDataSource.save(entity);
    final dto = data.toDto();
    final event = SyncEvent(
      entityTypeIndex: EntityType.account.index,
      eventTypeIndex: EventType.update.index,
      entityId: data.id.toString(),
      payloadJson: jsonEncode(dto.toJson()),
      timestamp: DateTime.now().toUtc(),
    );
    syncService.addEvent(event);
    final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
    final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
    return entity.toDomain(
      incomeStats: incomeStats,
      expenseStats: expenseStats,
    );
  }

  @override
  Future<Account?> getByApiId(int apiId) async {
    final entity = await localDataSource.getByApiId(apiId);
    if (entity == null) return null;

    var incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
    var expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);

    if (incomeStats.isEmpty || expenseStats.isEmpty) {
      final dto = await remoteDataSource.getResponseById(entity.apiId);
      if (dto == null) return null;
      incomeStats = dto.incomeStats.map((statItem) => statItem.toEntity(accountApiId: dto.id, isIncome: true)).toList();
      expenseStats = dto.expenseStats.map((statItem) => statItem.toEntity(accountApiId: dto.id, isIncome: false)).toList();
      await statItemLocalDataSource.saveAll([...incomeStats, ...expenseStats]);
    }

    return entity.toDomain(
      incomeStats: incomeStats,
      expenseStats: expenseStats,
    );
  }

  @override
  Future<void> updateLocalBalance(int accountId, double newBalance) async {
    final entity = await localDataSource.getById(accountId);
    if (entity != null) {
      entity.balance = newBalance.toStringAsFixed(2);
      entity.updatedAt = DateTime.now().toUtc();
      await localDataSource.save(entity);
    }
  }
}
