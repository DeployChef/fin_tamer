import '../entities/category_entity.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';

extension CategoryEntityMapper on CategoryEntity {
  Category toDomain() => Category(
        id: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}

extension CategoryDomainMapper on Category {
  CategoryEntity toEntity() => CategoryEntity(
        id: 0,
        apiId: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}
