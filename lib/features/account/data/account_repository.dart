import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/mappers/account_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/mappers/account_local_mapper.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';

class AccountRepository implements IAccountRepository {
  final MockRemoteAccountDataSource remoteDataSource;
  final AccountLocalDataSource localDataSource;
  final StatItemLocalDataSource statItemLocalDataSource;

  AccountRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.statItemLocalDataSource,
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
    for (final entity in accountEntities) {
      final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
      final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
      await statItemLocalDataSource.saveAll(incomeStats);
      await statItemLocalDataSource.saveAll(expenseStats);
    }
    return accountEntities.map((entity) => entity.toDomain()).toList();
  }

  @override
  Future<Account?> getById(int id) async {
    final entity = await localDataSource.getById(id);
    if (entity != null) {
      final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
      final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
      return entity.toDomain(
        incomeStats: incomeStats,
        expenseStats: expenseStats,
      );
    }
    final dto = await remoteDataSource.getById(id);
    if (dto == null) return null;
    final entityFromDto = dto.toEntity();
    await localDataSource.save(entityFromDto);
    final incomeStats = await statItemLocalDataSource.getByAccount(entityFromDto.apiId, isIncome: true);
    final expenseStats = await statItemLocalDataSource.getByAccount(entityFromDto.apiId, isIncome: false);
    return entityFromDto.toDomain(
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
    final dto = await remoteDataSource.update(data.id, data.toDto());
    if (dto == null) return null;
    final entity = dto.toEntity();
    await localDataSource.save(entity);
    final incomeStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: true);
    final expenseStats = await statItemLocalDataSource.getByAccount(entity.apiId, isIncome: false);
    return entity.toDomain(
      incomeStats: incomeStats,
      expenseStats: expenseStats,
    );
  }

  Future<void> updateAccountName(int id, String newName) async {
    var entity = await localDataSource.getById(id);
    if (entity != null) {
      entity.name = newName;
      entity.updatedAt = DateTime.now().toUtc();
      await localDataSource.save(entity);
      await remoteDataSource.updateAccountName(entity.apiId, newName);
    }
  }
}
