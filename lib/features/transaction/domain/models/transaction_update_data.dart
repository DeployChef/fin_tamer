import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_update_data.freezed.dart';
part 'transaction_update_data.g.dart';

@freezed
abstract class TransactionUpdateData with _$TransactionUpdateData {
  const TransactionUpdateData._();

  const factory TransactionUpdateData({
    required int id,
    required int accountId,
    required int categoryId,
    required double amount,
    required DateTime transactionDate,
    String? comment,
  }) = _TransactionUpdateData;

  factory TransactionUpdateData.fromJson(Map<String, dynamic> json) => _$TransactionUpdateDataFromJson(json);
}
