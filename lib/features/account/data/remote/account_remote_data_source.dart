import 'dto/account_dto.dart';
import 'dto/account_create_request_dto.dart';
import 'dto/account_update_request_dto.dart';
import 'dto/account_response_dto.dart';

class MockRemoteAccountDataSource {
  final _db = [
    AccountDto(
      id: 1,
      userId: 1,
      name: 'Основной счёт',
      balance: '1000.00',
      currency: 'RUB',
      createdAt: DateTime.parse('2025-06-09T16:54:53.139Z'),
      updatedAt: DateTime.parse('2025-06-09T16:54:53.139Z'),
    ),
  ];

  Future<List<AccountDto>> getAll() async {
    return _db;
  }

  Future<AccountDto> create(AccountCreateRequestDto request) async {
    final last = _db.last;
    final newAcc = AccountDto(
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

  Future<AccountResponseDto?> getResponseById(int id) async {
    final acc = _db.where((c) => c.id == id).firstOrNull;
    if (acc == null) return null;
    return AccountResponseDto(
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

  Future<AccountDto?> getById(int id) async {
    return _db.where((c) => c.id == id).firstOrNull;
  }

  Future<AccountDto?> update(int id, AccountUpdateRequestDto request) async {
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
      return updated;
    }
    return null;
  }

  Future<void> updateAccountName(int apiId, String newName) async {
    return;
  }
}
