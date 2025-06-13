import 'package:fin_tamer/features/history/domain/interfaces/i_history_repository.dart';
import 'package:fin_tamer/features/history/domain/models/account_history_response.dart';

class MockHistoryRepository implements IHistoryRepository {
  final _db = [
    AccountHistoryResponse.fromJson({
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

  @override
  Future<AccountHistoryResponse?> getAccountById(int id) async {
    return _db.where((c) => c.accountId == id).firstOrNull;
  }
}
