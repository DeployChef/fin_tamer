import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';

abstract interface class ITransactionRepository {
  Future<Transaction> create(TransactionCreateData data);

  Future<Transaction?> getById(int id);

  Future<Transaction?> update(TransactionUpdateData data);

  Future<void> delete(int id);

  Future<List<Transaction>> getByPeriod(int accountId, DateTime startDate, DateTime endDate);
}
