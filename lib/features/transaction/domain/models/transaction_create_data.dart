import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_create_data.freezed.dart';
part 'transaction_create_data.g.dart';

@freezed
abstract class TransactionCreateData with _$TransactionCreateData {
  const TransactionCreateData._();

  const factory TransactionCreateData({
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    String? comment,
  }) = _TransactionCreateData;

  factory TransactionCreateData.fromJson(Map<String, dynamic> json) => _$TransactionCreateDataFromJson(json);
}
