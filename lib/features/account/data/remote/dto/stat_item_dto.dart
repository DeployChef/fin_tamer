import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item_dto.freezed.dart';
part 'stat_item_dto.g.dart';

@freezed
abstract class StatItemDto with _$StatItemDto {
  const StatItemDto._();

  const factory StatItemDto({
    required int id,
    required String name,
    required String value,
  }) = _StatItemDto;

  factory StatItemDto.fromJson(Map<String, dynamic> json) => _$StatItemDtoFromJson(json);
}
