import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_create_request_dto.freezed.dart';
part 'account_create_request_dto.g.dart';

@freezed
abstract class AccountCreateRequestDto with _$AccountCreateRequestDto {
  const AccountCreateRequestDto._();

  const factory AccountCreateRequestDto({
    required String name,
    required String balance,
    required String currency,
  }) = _AccountCreateRequestDto;

  factory AccountCreateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountCreateRequestDtoFromJson(json);
}
