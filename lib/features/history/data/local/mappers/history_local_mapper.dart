import '../entities/history_entity.dart';
import 'package:fin_tamer/features/history/domain/models/account_history.dart';
import 'package:fin_tamer/features/history/domain/models/account_state.dart';
import 'package:fin_tamer/features/history/data/remote/dto/account_history_dto.dart';
import 'dart:convert';

extension HistoryEntityMapper on HistoryEntity {
  AccountHistory toDomain() => AccountHistory(
        id: apiId,
        accountId: accountId,
        changeType: changeType,
        previousState: AccountState.fromJson(jsonDecode(previousStateJson)),
        newState: AccountState.fromJson(jsonDecode(newStateJson)),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}

extension AccountHistoryDomainMapper on AccountHistory {
  HistoryEntity toEntity() => HistoryEntity(
        id: 0,
        apiId: id,
        accountId: accountId,
        changeType: changeType,
        previousStateJson: jsonEncode(previousState.toJson()),
        newStateJson: jsonEncode(newState.toJson()),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}

extension AccountHistoryDtoMapper on AccountHistoryDto {
  HistoryEntity toEntity() => HistoryEntity(
        id: 0,
        apiId: id,
        accountId: accountId,
        changeType: changeType,
        previousStateJson: jsonEncode(previousState.toJson()),
        newStateJson: jsonEncode(newState.toJson()),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}
