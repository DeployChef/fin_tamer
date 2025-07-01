import 'dto/account_dto.dart';
import 'dto/account_create_request_dto.dart';
import 'dto/account_update_request_dto.dart';
import 'dto/account_response_dto.dart';
import 'dto/stat_item_dto.dart';
import 'dart:math';

class MockRemoteAccountDataSource {
  final _db = [
    AccountResponseDto(
      id: 1,
      name: 'Основной счёт',
      balance: '1000.00',
      currency: 'RUB',
      incomeStats: [
        // Текущий месяц
        ...List.generate(
            31,
            (i) => StatItemDto(
                  id: i + 1,
                  name: DateTime(DateTime.now().year, DateTime.now().month, i + 1).toIso8601String().split('T').first,
                  value: (Random().nextInt(5000) + 1000).toString(),
                )),
        // Прошлый месяц
        ...List.generate(
            5,
            (i) => StatItemDto(
                  id: 100 + i,
                  name: DateTime(DateTime.now().year, DateTime.now().month - 1, i + 1).toIso8601String().split('T').first,
                  value: (Random().nextInt(5000) + 1000).toString(),
                )),
        // Позапрошлый месяц
        ...List.generate(
            5,
            (i) => StatItemDto(
                  id: 200 + i,
                  name: DateTime(DateTime.now().year, DateTime.now().month - 2, i + 1).toIso8601String().split('T').first,
                  value: (Random().nextInt(5000) + 1000).toString(),
                )),
      ],
      expenseStats: [
        // Текущий месяц
        ...List.generate(
            31,
            (i) => StatItemDto(
                  id: i + 101,
                  name: DateTime(DateTime.now().year, DateTime.now().month, i + 1).toIso8601String().split('T').first,
                  value: (-Random().nextInt(5000) - 500).toString(),
                )),
        // Прошлый месяц
        ...List.generate(
            5,
            (i) => StatItemDto(
                  id: 300 + i,
                  name: DateTime(DateTime.now().year, DateTime.now().month - 1, i + 1).toIso8601String().split('T').first,
                  value: (-Random().nextInt(5000) - 500).toString(),
                )),
        // Позапрошлый месяц
        ...List.generate(
            5,
            (i) => StatItemDto(
                  id: 400 + i,
                  name: DateTime(DateTime.now().year, DateTime.now().month - 2, i + 1).toIso8601String().split('T').first,
                  value: (-Random().nextInt(5000) - 500).toString(),
                )),
      ],
      createdAt: DateTime.parse('2025-06-09T16:54:53.139Z'),
      updatedAt: DateTime.parse('2025-06-09T16:54:53.139Z'),
    ),
  ];

  AccountDto _toAccountDto(AccountResponseDto acc) {
    return AccountDto(
      id: acc.id,
      userId: 1,
      name: acc.name,
      balance: acc.balance,
      currency: acc.currency,
      createdAt: acc.createdAt,
      updatedAt: acc.updatedAt,
    );
  }

  Future<List<AccountDto>> getAll() async {
    return _db.map(_toAccountDto).toList();
  }

  Future<AccountDto> create(AccountCreateRequestDto request) async {
    final last = _db.last;
    final newAcc = AccountResponseDto(
      id: last.id + 1,
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      incomeStats: [],
      expenseStats: [],
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
    _db.add(newAcc);
    return _toAccountDto(newAcc);
  }

  Future<AccountResponseDto?> getResponseById(int id) async {
    return _db.where((c) => c.id == id).firstOrNull;
  }

  Future<AccountDto?> getById(int id) async {
    final acc = _db.where((c) => c.id == id).firstOrNull;
    if (acc == null) return null;
    return _toAccountDto(acc);
  }

  Future<AccountDto?> update(int id, AccountUpdateRequestDto request) async {
    final acc = _db.where((c) => c.id == id).firstOrNull;
    if (acc != null) {
      _db.remove(acc);
      final updated = acc.copyWith(
        name: request.name,
        balance: request.balance,
        currency: request.currency,
        updatedAt: DateTime.now().toUtc(),
      );
      _db.add(updated);
      return _toAccountDto(updated);
    }
    return null;
  }

  Future<void> updateAccountName(int apiId, String newName) async {
    final acc = _db.where((c) => c.id == apiId).firstOrNull;
    if (acc != null) {
      _db.remove(acc);
      _db.add(acc.copyWith(name: newName, updatedAt: DateTime.now().toUtc()));
    }
    return;
  }
}
