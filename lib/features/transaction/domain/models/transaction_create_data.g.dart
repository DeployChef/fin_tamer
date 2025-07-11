// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_create_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionCreateData _$TransactionCreateDataFromJson(
        Map<String, dynamic> json) =>
    _TransactionCreateData(
      accountId: (json['accountId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$TransactionCreateDataToJson(
        _TransactionCreateData instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'comment': instance.comment,
    };
