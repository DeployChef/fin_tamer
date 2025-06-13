import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_request.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';

class MockTransactionRepository implements ITransactionRepository {
  final IAccountRepository accountRepository;
  final ICategoryRepository categoryRepository;

  MockTransactionRepository(this.accountRepository, this.categoryRepository);

  final _db = [
    Transaction.fromJson({
      "id": 1,
      "accountId": 1,
      "categoryId": 1,
      "amount": "500.00",
      "transactionDate": "2025-06-10T15:42:43.487Z",
      "comment": "Зарплата за месяц",
      "createdAt": "2025-06-10T15:42:43.487Z",
      "updatedAt": "2025-06-10T15:42:43.487Z"
    }),
  ];

  @override
  Future<Transaction> create(TransactionRequest request) async {
    final last = _db.last;
    final newTransaction = Transaction(
      id: last.id + 1,
      accountId: request.accountId,
      categoryId: request.categoryId,
      amount: request.amount,
      transactionDate: request.transactionDate,
      comment: request.comment,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );

    _db.add(newTransaction);

    return newTransaction;
  }

  @override
  Future<TransactionResponse?> update(int id, TransactionRequest request) async {
    final itemForUpdate = _db.where((c) => c.id == id).firstOrNull;
    if (itemForUpdate == null) {
      return null;
    }

    _db.remove(itemForUpdate);
    final updated = itemForUpdate.copyWith(
      accountId: request.accountId,
      categoryId: request.categoryId,
      amount: request.amount,
      transactionDate: request.transactionDate,
      comment: request.comment,
      updatedAt: DateTime.now().toUtc(),
    );
    _db.add(updated);

    final response = await _createTransactionResponse(updated);

    return response;
  }

  @override
  Future<void> delete(int id) async {
    final transaction = _db.where((c) => c.id == id).firstOrNull;
    if (transaction != null) {
      _db.remove(transaction);
    }
  }

  @override
  Future<TransactionResponse?> getById(int id) async {
    final transaction = _db.where((c) => c.id == id).firstOrNull;
    if (transaction == null) return null;

    return await _createTransactionResponse(transaction);
  }

  @override
  Future<List<TransactionResponse>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    final transactions = _db.where((c) => c.accountId == accountId && c.transactionDate.isAfter(startDate) && c.transactionDate.isBefore(endDate));

    List<TransactionResponse> result = [];

    for (var transaction in transactions) {
      var response = await _createTransactionResponse(transaction);
      if (response != null) {
        result.add(response);
      }
    }
    return result;
  }

  Future<TransactionResponse?> _createTransactionResponse(Transaction transaction) async {
    final acc = await accountRepository.getById(transaction.accountId);
    if (acc == null) return null;

    final categories = await categoryRepository.getAll();
    final category = categories.where((c) => c.id == transaction.categoryId).firstOrNull;
    if (category == null) return null;

    return TransactionResponse(
      id: acc.id,
      account: AccountBrief(
        id: acc.id,
        name: acc.name,
        balance: acc.balance,
        currency: acc.currency,
      ),
      category: category,
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      comment: transaction.comment,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
    );
  }
}
