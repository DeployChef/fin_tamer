import 'package:fin_tamer/features/history/domain/models/account_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history_feed.freezed.dart';
part 'account_history_feed.g.dart';

@freezed
abstract class AccountHistoryFeed with _$AccountHistoryFeed {
  const AccountHistoryFeed._();

  const factory AccountHistoryFeed({
    required int accountId,
    required String accountName,
    required String currency,
    required String currentBalance,
    required List<AccountHistory> history,
  }) = _AccountHistoryFeed;

  factory AccountHistoryFeed.fromJson(Map<String, dynamic> json) => _$AccountHistoryFeedFromJson(json);
}
