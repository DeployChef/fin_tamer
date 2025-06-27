import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_history_dto.dart';

part 'account_history_response_dto.freezed.dart';
part 'account_history_response_dto.g.dart';

// DTO для ответа API (агрегат истории аккаунта)
@freezed
abstract class AccountHistoryResponseDto with _$AccountHistoryResponseDto {
  const AccountHistoryResponseDto._();

  const factory AccountHistoryResponseDto({
    required int accountId,
    required String accountName,
    required String currency,
    required String currentBalance,
    required List<AccountHistoryDto> history,
  }) = _AccountHistoryResponseDto;

  factory AccountHistoryResponseDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryResponseDtoFromJson(json);
}
