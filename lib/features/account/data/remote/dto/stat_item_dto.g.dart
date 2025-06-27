// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatItemDto _$StatItemDtoFromJson(Map<String, dynamic> json) => _StatItemDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$StatItemDtoToJson(_StatItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
