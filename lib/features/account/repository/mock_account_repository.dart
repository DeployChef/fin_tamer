import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_request.dart';
import 'package:fin_tamer/features/account/domain/models/account_response.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_request.dart';

class MockAccountRepository implements IAccountRepository {
  final _db = [
    Account.fromJson(
      {"id": 1, "userId": 1, "name": "Основной счёт", "balance": "1000.00", "currency": "RUB", "createdAt": "2025-06-09T16:54:53.139Z", "updatedAt": "2025-06-09T16:54:53.139Z"},
    ),
  ];

  @override
  Future<List<Account>> getAll() async {
    return _db;
  }

  @override
  Future<Account> create(AccountCreateRequest request) async {
    final last = _db.last;
    final newAcc = Account(
      id: last.id + 1,
      userId: last.userId,
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );

    _db.add(newAcc);

    return newAcc;
  }

  @override
  Future<AccountResponse?> getById(int id) async {
    final acc = _db.where((c) => c.id == id).firstOrNull;
    if (acc == null) return null;

    return AccountResponse(
      id: acc.id,
      name: acc.name,
      balance: acc.balance,
      currency: acc.currency,
      incomeStats: [],
      expenseStats: [],
      createdAt: acc.createdAt,
      updatedAt: acc.updatedAt,
    );
  }

  @override
  Future<Account?> update(int id, AccountUpdateRequest request) async {
    final itemForUpdate = _db.where((c) => c.id == id).firstOrNull;
    if (itemForUpdate != null) {
      _db.remove(itemForUpdate);
      final updated = itemForUpdate.copyWith(
        balance: request.balance,
        name: request.name,
        currency: request.currency,
        updatedAt: DateTime.now().toUtc(),
      );
      _db.add(updated);
    }
    return itemForUpdate;
  }
}
