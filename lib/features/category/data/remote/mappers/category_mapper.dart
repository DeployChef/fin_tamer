import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';

extension CategoryDtoMapper on CategoryDto {
  Category toDomain() => Category(
        id: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}

extension CategoryToDtoMapper on Category {
  CategoryDto toDto() => CategoryDto(
        id: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}
