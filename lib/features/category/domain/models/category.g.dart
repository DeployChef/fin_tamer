// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
      id: (json['id'] as num).toInt(),
      apiId: (json['apiId'] as num).toInt(),
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      isIncome: json['isIncome'] as bool,
    );

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'name': instance.name,
      'emoji': instance.emoji,
      'isIncome': instance.isIncome,
    };
