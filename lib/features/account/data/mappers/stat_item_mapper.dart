import 'package:fin_tamer/features/account/data/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';

extension StatItemMapper on StatItemEntity {
  StatItem toModel() => StatItem(
        categoryId: categoryId,
        categoryName: categoryName,
        emoji: emoji,
        amount: amount,
      );

  static StatItemEntity fromModel(StatItem item) => StatItemEntity(
        categoryId: item.categoryId,
        categoryName: item.categoryName,
        emoji: item.emoji,
        amount: item.amount,
      );
}
