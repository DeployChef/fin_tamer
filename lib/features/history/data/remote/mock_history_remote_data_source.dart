import 'package:fin_tamer/features/history/data/remote/dto/account_history_response_dto.dart';
import 'package:fin_tamer/features/history/data/remote/interfaces/i_history_remote_data_source.dart';
import 'dart:math';

class MockHistoryRemoteDataSource implements IHistoryRemoteDataSource {
  final _db = [
    AccountHistoryResponseDto.fromJson({
      "accountId": 1,
      "accountName": "Основной счет",
      "currency": "USD",
      "currentBalance": "2000.00",
      "history": (() {
        final now = DateTime.now();
        final List<Map<String, dynamic>> list = [];
        double prevBalance = 0;
        final random = Random();
        // Текущий месяц (25 записей)
        for (int i = 0; i < 25; i++) {
          final day = (i * (28 / 24)).round() + 1;
          final date = DateTime(now.year, now.month, day, 12);
          final diff = random.nextDouble() * 2000 - 1000;
          final newBalance = prevBalance + diff;
          list.add({
            "id": i + 1,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": prevBalance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": newBalance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          });
          prevBalance = newBalance;
        }
        // Прошлый месяц (15 записей)
        prevBalance = 0;
        for (int i = 0; i < 15; i++) {
          final day = (i * (28 / 14)).round() + 1;
          final date = DateTime(now.year, now.month - 1, day, 12);
          final diff = random.nextDouble() * 2000 - 1000;
          final newBalance = prevBalance + diff;
          list.add({
            "id": 100 + i,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": prevBalance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": newBalance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          });
          prevBalance = newBalance;
        }
        // Следующий месяц (10 записей)
        prevBalance = 0;
        for (int i = 0; i < 10; i++) {
          final day = (i * (28 / 9)).round() + 1;
          final date = DateTime(now.year, now.month + 1, day, 12);
          final diff = random.nextDouble() * 2000 - 1000;
          final newBalance = prevBalance + diff;
          list.add({
            "id": 200 + i,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": prevBalance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": newBalance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          });
          prevBalance = newBalance;
        }
        return list;
      })(),
    }),
  ];

  @override
  Future<AccountHistoryResponseDto?> getAccountById(int apiId) async {
    return _db.where((c) => c.accountId == apiId).firstOrNull;
  }
}
