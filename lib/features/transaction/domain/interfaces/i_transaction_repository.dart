import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_request.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';

abstract interface class ITransactionRepository {
  Future<Transaction> create(TransactionRequest request);

  Future<TransactionResponse?> getById(int id);

  Future<TransactionResponse?> update(int id, TransactionRequest request);

  Future<void> delete(int id);

  Future<List<TransactionResponse>> getByPeriod(int accountId, DateTime startDate, DateTime endDate);
}
