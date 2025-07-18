import '../entities/transaction_entity.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';

extension TransactionEntityMapper on TransactionEntity {
  Transaction toDomain({
    required AccountBrief account,
    required Category category,
  }) =>
      Transaction(
        id: id,
        account: account,
        category: category,
        amount: double.tryParse(amount)!,
        comment: comment,
        transactionDate: transactionDate.toLocal(),
        createdAt: createdAt.toLocal(),
        updatedAt: updatedAt.toLocal(),
      );
}

extension TransactionDomainMapper on Transaction {
  TransactionEntity toEntity() => TransactionEntity(
        id: 0,
        apiId: id,
        accountId: account.id,
        accountApiId: account.id,
        categoryApiId: category.id,
        amount: amount.toString(),
        transactionDate: transactionDate.toLocal(),
        comment: comment,
        createdAt: createdAt.toLocal(),
        updatedAt: updatedAt.toLocal(),
      );
}
