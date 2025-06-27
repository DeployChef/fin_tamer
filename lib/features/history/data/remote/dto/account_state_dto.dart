import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state_dto.freezed.dart';
part 'account_state_dto.g.dart';

@freezed
abstract class AccountStateDto with _$AccountStateDto {
  const AccountStateDto._();

  const factory AccountStateDto({
    required int id,
    required String name,
    required String balance,
    required String currency,
  }) = _AccountStateDto;

  factory AccountStateDto.fromJson(Map<String, dynamic> json) => _$AccountStateDtoFromJson(json);
}
