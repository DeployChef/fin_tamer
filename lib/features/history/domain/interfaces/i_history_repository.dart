import 'package:fin_tamer/features/history/domain/models/account_history_response.dart';

abstract interface class IHistoryRepository {
  Future<AccountHistoryResponse?> getAccountById(int id);
}
