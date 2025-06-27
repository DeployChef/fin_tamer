// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_update_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountUpdateRequestDto _$AccountUpdateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _AccountUpdateRequestDto(
      name: json['name'] as String,
      balance: json['balance'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountUpdateRequestDtoToJson(
        _AccountUpdateRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };
