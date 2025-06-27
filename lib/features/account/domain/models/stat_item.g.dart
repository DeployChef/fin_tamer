// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatItem _$StatItemFromJson(Map<String, dynamic> json) => _StatItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$StatItemToJson(_StatItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
