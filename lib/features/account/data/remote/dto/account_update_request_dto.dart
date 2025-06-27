import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_request_dto.freezed.dart';
part 'account_update_request_dto.g.dart';

@freezed
abstract class AccountUpdateRequestDto with _$AccountUpdateRequestDto {
  const AccountUpdateRequestDto._();

  const factory AccountUpdateRequestDto({
    required String name,
    required String balance,
    required String currency,
  }) = _AccountUpdateRequestDto;

  factory AccountUpdateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountUpdateRequestDtoFromJson(json);
}
