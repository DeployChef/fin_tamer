import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/mappers/account_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/mappers/account_local_mapper.dart';
import 'package:fin_tamer/features/account/data/local/mappers/stat_item_local_mapper.dart';

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
    final accountEntities = dtos.map((e) => e.toDomain().toEntity()).toList();
    await localDataSource.saveAll(accountEntities);
    for (final dto in dtos) {
      final domain = dto.toDomain();
      await statItemLocalDataSource.saveAll(mapIncomeStatsToEntities(domain.incomeStats, domain.id));
      await statItemLocalDataSource.saveAll(mapExpenseStatsToEntities(domain.expenseStats, domain.id));
    }
    return dtos.map((e) => e.toDomain()).toList();
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
    final domain = dto.toDomain();
    await localDataSource.save(domain.toEntity());
    await statItemLocalDataSource.saveAll(mapIncomeStatsToEntities(domain.incomeStats, domain.id));
    await statItemLocalDataSource.saveAll(mapExpenseStatsToEntities(domain.expenseStats, domain.id));
    return domain;
  }

  @override
  Future<Account> create(AccountCreateData data) async {
    final dto = await remoteDataSource.create(data.toDto());
    return dto.toDomain();
  }

  @override
  Future<Account?> update(AccountUpdateData data) async {
    final dto = await remoteDataSource.update(data.id, data.toDto());
    return dto?.toDomain();
  }
}
