import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';

extension AccountEntityMapper on AccountEntity {
  Account toModel() => Account(
        id: id,
        userId: userId,
        name: name,
        balance: balance,
        currency: currency,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  static AccountEntity fromModel(Account model) => AccountEntity(
        id: model.id,
        userId: model.userId,
        name: model.name,
        balance: model.balance,
        currency: model.currency,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
      );
}
