import 'package:fin_tamer/features/history/domain/models/account_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history.freezed.dart';
part 'account_history.g.dart';

@freezed
abstract class AccountHistory with _$AccountHistory {
  const AccountHistory._();

  const factory AccountHistory({
    required int id,
    required int accountId,
    required String changeType,
    required AccountState previousState,
    required AccountState newState,
    required DateTime changeTimestamp,
    required DateTime createdAt,
  }) = _AccountHistory;

  factory AccountHistory.fromJson(Map<String, dynamic> json) => _$AccountHistoryFromJson(json);
}
