// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_history_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountHistoryFeed _$AccountHistoryFeedFromJson(Map<String, dynamic> json) =>
    _AccountHistoryFeed(
      accountId: (json['accountId'] as num).toInt(),
      accountName: json['accountName'] as String,
      currency: json['currency'] as String,
      currentBalance: (json['currentBalance'] as num).toDouble(),
      history: (json['history'] as List<dynamic>)
          .map((e) => AccountHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountHistoryFeedToJson(_AccountHistoryFeed instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'currency': instance.currency,
      'currentBalance': instance.currentBalance,
      'history': instance.history,
    };
