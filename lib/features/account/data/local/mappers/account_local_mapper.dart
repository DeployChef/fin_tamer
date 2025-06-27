import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/data/local/mappers/stat_item_local_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_brief.dart';

extension AccountEntityMapper on AccountEntity {
  Account toDomain({
    List<StatItemEntity> incomeStats = const [],
    List<StatItemEntity> expenseStats = const [],
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

extension AccountEntityToBrief on AccountEntity {
  AccountBrief toBrief() => AccountBrief(
        id: apiId,
        name: name,
        balance: balance,
        currency: currency,
      );
}
