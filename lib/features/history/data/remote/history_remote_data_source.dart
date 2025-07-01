import 'dto/account_history_response_dto.dart';
import 'dart:math';

class HistoryRemoteDataSource {
  final _db = [
    AccountHistoryResponseDto.fromJson({
      "accountId": 1,
      "accountName": "Основной счет",
      "currency": "USD",
      "currentBalance": "2000.00",
      "history": [
        // Текущий месяц (25 записей)
        ...List.generate(25, (i) {
          final now = DateTime.now();
          final day = (i * (28 / 24)).round() + 1; // равномерно по месяцу
          final date = DateTime(now.year, now.month, day, 12);
          final balance = 1000 + 500 * (1 + sin(0.9 * (i / 24) * 2 * pi));
          return {
            "id": i + 1,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          };
        }),
        // Прошлый месяц (15 записей)
        ...List.generate(15, (i) {
          final now = DateTime.now();
          final day = (i * (28 / 14)).round() + 1;
          final date = DateTime(now.year, now.month - 1, day, 12);
          final balance = 1000 + 500 * (1 + sin(0.9 * (i / 14) * 2 * pi));
          return {
            "id": 100 + i,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          };
        }),
        // Следующий месяц (10 записей)
        ...List.generate(10, (i) {
          final now = DateTime.now();
          final day = (i * (28 / 9)).round() + 1;
          final date = DateTime(now.year, now.month + 1, day, 12);
          final balance = 1000 + 500 * (1 + sin(0.9 * (i / 9) * 2 * pi));
          return {
            "id": 200 + i,
            "accountId": 1,
            "changeType": "MODIFICATION",
            "previousState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "newState": {"id": 1, "name": "Основной счет", "balance": balance.toStringAsFixed(2), "currency": "USD"},
            "changeTimestamp": date.toIso8601String(),
            "createdAt": date.toIso8601String(),
          };
        }),
      ]
    }),
  ];

  Future<AccountHistoryResponseDto?> getAccountById(int apiId) async {
    return _db.where((c) => c.accountId == apiId).firstOrNull;
  }
}
