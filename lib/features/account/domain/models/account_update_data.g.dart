// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_update_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountUpdateData _$AccountUpdateDataFromJson(Map<String, dynamic> json) =>
    _AccountUpdateData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: json['balance'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountUpdateDataToJson(_AccountUpdateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };
