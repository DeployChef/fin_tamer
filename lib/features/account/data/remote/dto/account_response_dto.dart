import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    required List<StatItem> incomeStats,
    required List<StatItem> expenseStats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountResponseDto;

  factory AccountResponseDto.fromJson(Map<String, dynamic> json) => _$AccountResponseDtoFromJson(json);
}
