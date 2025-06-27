import '../entities/account_entity.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import '../entities/stat_item_entity.dart';
import 'stat_item_local_mapper.dart';

extension AccountEntityMapper on AccountEntity {
  Account toDomain({
    required List<StatItemEntity> incomeStats,
    required List<StatItemEntity> expenseStats,
  }) =>
      Account(
        id: apiId,
        name: name,
        balance: balance,
        currency: currency,
        incomeStats: incomeStats.map((e) => e.toDomain()).toList(),
        expenseStats: expenseStats.map((e) => e.toDomain()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension AccountDomainMapper on Account {
  AccountEntity toEntity() => AccountEntity(
        id: 0,
        apiId: id,
        name: name,
        balance: balance,
        currency: currency,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
