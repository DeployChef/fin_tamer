import 'dto/account_history_response_dto.dart';

class HistoryRemoteDataSource {
  final _db = [
    AccountHistoryResponseDto.fromJson({
      "accountId": 1,
      "accountName": "Основной счет",
      "currency": "USD",
      "currentBalance": "2000.00",
      "history": [
        {
          "id": 1,
          "accountId": 1,
          "changeType": "MODIFICATION",
          "previousState": {"id": 1, "name": "Основной счет", "balance": "1000.00", "currency": "USD"},
          "newState": {"id": 1, "name": "Основной счет", "balance": "1000.00", "currency": "USD"},
          "changeTimestamp": "2025-06-10T15:38:23.365Z",
          "createdAt": "2025-06-10T15:38:23.365Z"
        }
      ]
    }),
  ];

  Future<AccountHistoryResponseDto?> getAccountById(int id) async {
    return _db.where((c) => c.accountId == id).firstOrNull;
  }
}
