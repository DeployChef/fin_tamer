import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required int id,
    required AccountBrief account,
    required Category category,
    required double amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
