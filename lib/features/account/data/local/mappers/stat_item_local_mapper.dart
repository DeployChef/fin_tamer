import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';

extension StatItemEntityMapper on StatItemEntity {
  StatItem toDomain() => StatItem(
        id: apiId,
        name: name,
        value: value,
      );
}

extension StatItemDomainMapper on StatItem {
  StatItemEntity toIncomeEntity({required int accountApiId}) => StatItemEntity(
        id: 0,
        apiId: id,
        accountApiId: accountApiId,
        isIncome: true,
        name: name,
        value: value,
      );
  StatItemEntity toExpenseEntity({required int accountApiId}) => StatItemEntity(
        id: 0,
        apiId: id,
        accountApiId: accountApiId,
        isIncome: false,
        name: name,
        value: value,
      );
}

List<StatItemEntity> mapIncomeStatsToEntities(List<StatItem> stats, int accountApiId) => stats.map((e) => e.toIncomeEntity(accountApiId: accountApiId)).toList();

List<StatItemEntity> mapExpenseStatsToEntities(List<StatItem> stats, int accountApiId) => stats.map((e) => e.toExpenseEntity(accountApiId: accountApiId)).toList();
