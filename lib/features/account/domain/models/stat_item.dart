import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_item.freezed.dart';
part 'stat_item.g.dart';

@freezed
abstract class StatItem with _$StatItem {
  const StatItem._();
  const factory StatItem({
    required int id,
    required String name,
    required String value,
  }) = _StatItem;

  factory StatItem.fromJson(Map<String, dynamic> json) => _$StatItemFromJson(json);
}
