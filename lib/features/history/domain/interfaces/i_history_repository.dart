import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';

abstract interface class IHistoryRepository {
  Future<AccountHistoryFeed?> getAccountById(int id);
}
