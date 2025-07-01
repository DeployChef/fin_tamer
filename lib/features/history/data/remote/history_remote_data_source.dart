import 'dto/account_history_response_dto.dart';
import 'dart:math';

class HistoryRemoteDataSource {
  final _db = [
    AccountHistoryResponseDto.fromJson({
      "accountId": 1,
      "accountName": "Основной счет",
      "currency": "USD",
      "currentBalance": "2000.00",
      "history": (() {
        final now = DateTime.now();
        final List<Map<String, dynamic>> list = [];
        double prevBalance = 1000;
        // Текущий месяц (25 записей)
        for (int i = 0; i < 25; i++) {
          final day = (i * (28 / 24)).round() + 1;
          final date = DateTime(now.year, now.month, day, 12);
          final diff = 250 * sin(0.9 * (i / 24) * 2 * pi);
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
        prevBalance = 1000;
        for (int i = 0; i < 15; i++) {
          final day = (i * (28 / 14)).round() + 1;
          final date = DateTime(now.year, now.month - 1, day, 12);
          final diff = 250 * sin(0.9 * (i / 14) * 2 * pi);
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
        prevBalance = 1000;
        for (int i = 0; i < 10; i++) {
          final day = (i * (28 / 9)).round() + 1;
          final date = DateTime(now.year, now.month + 1, day, 12);
          final diff = 250 * sin(0.9 * (i / 9) * 2 * pi);
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

  Future<AccountHistoryResponseDto?> getAccountById(int apiId) async {
    return _db.where((c) => c.accountId == apiId).firstOrNull;
  }
}
