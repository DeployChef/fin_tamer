// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
      id: (json['id'] as num).toInt(),
      apiId: (json['apiId'] as num).toInt(),
      name: json['name'] as String,
      balance: json['balance'] as String,
      currency: json['currency'] as String,
      incomeStats: (json['incomeStats'] as List<dynamic>?)
              ?.map((e) => StatItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expenseStats: (json['expenseStats'] as List<dynamic>?)
              ?.map((e) => StatItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
      'incomeStats': instance.incomeStats,
      'expenseStats': instance.expenseStats,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
