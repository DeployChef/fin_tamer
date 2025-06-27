import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
abstract class AccountDto with _$AccountDto {
  const AccountDto._();

  const factory AccountDto({
    required int id,
    required int userId,
    required String name,
    required String balance,
    required String currency,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
}
