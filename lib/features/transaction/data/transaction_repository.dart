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
    final dto = await remoteDataSource.create(data.toDto());
    final entity = dto.toDomain().toEntity();
    await localDataSource.save(entity);
    return dto.toDomain();
  }

  @override
  Future<Transaction?> update(TransactionUpdateData data) async {
    final dto = await remoteDataSource.update(data.id, data.toDto());
    if (dto != null) {
      final entity = dto.toDomain().toEntity();
      await localDataSource.save(entity);
    }
    return dto?.toDomain();
  }

  @override
  Future<void> delete(int id) async {
    await remoteDataSource.delete(id);
    // Можно также удалить из локального хранилища
    // await localDataSource.delete(id);
  }

  @override
  Future<Transaction?> getById(int id) async {
    final entity = await localDataSource.getById(id);
    if (entity != null) {
      final accountEntity = await accountLocalDataSource.getById(entity.accountApiId);
      final categoryEntity = await categoryLocalDataSource.getById(entity.categoryApiId);

      if (accountEntity == null || categoryEntity == null) {
        //TODO обработка ошибок
        return null;
      }

      final category = categoryEntity.toDomain();
      final account = accountEntity.toDomain().toBrief();

      return entity.toDomain(account: account, category: category);
    }

    final dto = await remoteDataSource.getById(id);
    if (dto == null) return null;
    final domain = dto.toDomain();
    await localDataSource.save(domain.toEntity());
    return domain;
  }

  @override
  Future<List<Transaction>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    final localEntities = await localDataSource.getByAccount(accountId);
    final filtered = localEntities.where((e) => e.transactionDate.isAfter(startDate) && e.transactionDate.isBefore(endDate)).toList();
    if (filtered.isNotEmpty) {
      return Future.wait(filtered.map((entity) async {
        final accountEntity = await accountLocalDataSource.getById(entity.accountApiId);
        final categoryEntity = await categoryLocalDataSource.getById(entity.categoryApiId);

        if (accountEntity == null || categoryEntity == null) {
          //TODO обработка ошибок
          throw Exception('Account or Category not found for transaction');
        }

        final category = categoryEntity.toDomain();
        final account = accountEntity.toDomain().toBrief();

        return entity.toDomain(account: account, category: category);
      }));
    }
    final dtos = await remoteDataSource.getByPeriod(accountId, startDate, endDate);
    final entities = dtos.map((dto) => dto.toDomain().toEntity()).toList();
    await localDataSource.saveAll(entities);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
