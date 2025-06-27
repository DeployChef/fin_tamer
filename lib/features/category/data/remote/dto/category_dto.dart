import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fin_tamer/features/category/data/local/entities/category_entity.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDto with _$CategoryDto {
  const CategoryDto._();

  const factory CategoryDto({
    required int id,
    required String name,
    required String emoji,
    required bool isIncome,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}

extension CategoryDtoToEntity on CategoryDto {
  CategoryEntity toEntity() => CategoryEntity(
        id: 0, // всегда новый, ObjectBox сам назначит
        apiId: id, // id из DTO — это apiId
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}
