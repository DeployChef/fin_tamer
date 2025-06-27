import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';

extension CategoryToDtoMapper on Category {
  CategoryDto toDto() => CategoryDto(
        id: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}
