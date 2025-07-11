// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_update_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionUpdateData _$TransactionUpdateDataFromJson(
        Map<String, dynamic> json) =>
    _TransactionUpdateData(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$TransactionUpdateDataToJson(
        _TransactionUpdateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'comment': instance.comment,
    };
