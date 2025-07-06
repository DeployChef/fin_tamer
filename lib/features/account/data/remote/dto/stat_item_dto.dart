import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item_dto.freezed.dart';
part 'stat_item_dto.g.dart';

@freezed
abstract class StatItemDto with _$StatItemDto {
  const StatItemDto._();

  const factory StatItemDto({
    required int categoryId,
    required String categoryName,
    required String emoji,
    required String amount,
  }) = _StatItemDto;

  factory StatItemDto.fromJson(Map<String, dynamic> json) => _$StatItemDtoFromJson(json);
}
