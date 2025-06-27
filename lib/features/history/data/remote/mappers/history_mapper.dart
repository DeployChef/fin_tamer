import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';
import 'package:fin_tamer/features/history/domain/models/account_history.dart';
import 'package:fin_tamer/features/history/domain/models/account_state.dart';
import '../dto/account_history_response_dto.dart';
import '../dto/account_history_dto.dart';
import '../dto/account_state_dto.dart';

extension AccountHistoryResponseDtoMapper on AccountHistoryResponseDto {
  AccountHistoryFeed toDomain() => AccountHistoryFeed(
        accountId: accountId,
        accountName: accountName,
        currency: currency,
        currentBalance: currentBalance,
        history: history.map((e) => e.toDomain()).toList(),
      );
}

extension AccountHistoryDtoMapper on AccountHistoryDto {
  AccountHistory toDomain() => AccountHistory(
        id: id,
        accountId: accountId,
        changeType: changeType,
        previousState: previousState.toDomain(),
        newState: newState.toDomain(),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}

extension AccountStateDtoMapper on AccountStateDto {
  AccountState toDomain() => AccountState(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}
