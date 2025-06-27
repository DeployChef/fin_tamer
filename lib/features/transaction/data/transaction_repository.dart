import 'package:fin_tamer/features/transaction/data/remote/mock_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';
import 'package:fin_tamer/features/transaction/data/remote/mappers/transaction_mapper.dart';

class TransactionRepository implements ITransactionRepository {
  final MockTransactionRemoteDataSource remoteDataSource;

  TransactionRepository(this.remoteDataSource);

  @override
  Future<Transaction> create(TransactionCreateData data) async {
    final dto = await remoteDataSource.create(data.toDto());
    return dto.toDomain();
  }

  @override
  Future<Transaction?> update(TransactionUpdateData data) async {
    final dto = await remoteDataSource.update(data.id, data.toDto());
    return dto?.toDomain();
  }

  @override
  Future<void> delete(int id) async {
    await remoteDataSource.delete(id);
  }

  @override
  Future<Transaction?> getById(int id) async {
    final dto = await remoteDataSource.getById(id);
    if (dto == null) return null;
    return dto.toDomain();
  }

  @override
  Future<List<Transaction>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    final dtos = await remoteDataSource.getByPeriod(accountId, startDate, endDate);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
