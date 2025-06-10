import 'package:fin_tamer/features/history/domain/models/account_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history_response.freezed.dart';
part 'account_history_response.g.dart';

@freezed
abstract class AccountHistoryResponse with _$AccountHistoryResponse {
  const AccountHistoryResponse._();

  const factory AccountHistoryResponse({
    required int accountId,
    required String accountName,
    required String currency,
    required String currentBalance,
    required List<AccountHistory> history,
  }) = _AccountHistoryResponse;

  factory AccountHistoryResponse.fromJson(Map<String, dynamic> json) => _$AccountHistoryResponseFromJson(json);
}
