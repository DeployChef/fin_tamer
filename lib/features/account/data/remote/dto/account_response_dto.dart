import 'package:freezed_annotation/freezed_annotation.dart';
import 'stat_item_dto.dart';

part 'account_response_dto.freezed.dart';
part 'account_response_dto.g.dart';

@freezed
abstract class AccountResponseDto with _$AccountResponseDto {
  const AccountResponseDto._();

  const factory AccountResponseDto({
    required int id,
    required String name,
    required String balance,
    required String currency,
    required List<StatItemDto> incomeStats,
    required List<StatItemDto> expenseStats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountResponseDto;

  factory AccountResponseDto.fromJson(Map<String, dynamic> json) => _$AccountResponseDtoFromJson(json);
}
