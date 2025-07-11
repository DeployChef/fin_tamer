import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:fin_tamer/features/account/data/remote/dto/stat_item_dto.dart';

extension StatItemEntityMapper on StatItemEntity {
  StatItem toDomain() => StatItem(
        categoryId: categoryId,
        categoryName: categoryName,
        emoji: emoji,
        amount: double.tryParse(amount) ?? 0.0,
      );
}

extension StatItemDomainMapper on StatItem {
  StatItemEntity toIncomeEntity({required int accountApiId}) => StatItemEntity(
        id: 0,
        apiId: categoryId,
        accountApiId: accountApiId,
        isIncome: true,
        categoryId: categoryId,
        categoryName: categoryName,
        emoji: emoji,
        amount: amount.toString(),
      );
  StatItemEntity toExpenseEntity({required int accountApiId}) => StatItemEntity(
        id: 0,
        apiId: categoryId,
        accountApiId: accountApiId,
        isIncome: false,
        categoryId: categoryId,
        categoryName: categoryName,
        emoji: emoji,
        amount: amount.toString(),
      );
}

List<StatItemEntity> mapIncomeStatsToEntities(List<StatItem> stats, int accountApiId) => stats.map((e) => e.toIncomeEntity(accountApiId: accountApiId)).toList();

List<StatItemEntity> mapExpenseStatsToEntities(List<StatItem> stats, int accountApiId) => stats.map((e) => e.toExpenseEntity(accountApiId: accountApiId)).toList();

extension StatItemDtoToEntity on StatItemDto {
  StatItemEntity toEntity({required int accountApiId, required bool isIncome}) => StatItemEntity(
        id: 0,
        apiId: categoryId,
        accountApiId: accountApiId,
        isIncome: isIncome,
        categoryId: categoryId,
        categoryName: categoryName,
        emoji: emoji,
        amount: amount,
      );
}
