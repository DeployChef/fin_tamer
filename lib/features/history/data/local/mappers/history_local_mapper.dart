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
        previousState: _accountStateFromJson(jsonDecode(previousStateJson)),
        newState: _accountStateFromJson(jsonDecode(newStateJson)),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}

AccountState _accountStateFromJson(Map<String, dynamic> json) {
  return AccountState(
    id: json['id'] as int,
    name: json['name'] as String,
    balance: double.tryParse(json['balance'].toString()) ?? 0,
    currency: json['currency'] as String,
  );
}

extension AccountHistoryDomainMapper on AccountHistory {
  HistoryEntity toEntity() => HistoryEntity(
        id: 0,
        apiId: id,
        accountId: accountId,
        changeType: changeType,
        previousStateJson: jsonEncode(_accountStateToJson(previousState)),
        newStateJson: jsonEncode(_accountStateToJson(newState)),
        changeTimestamp: changeTimestamp,
        createdAt: createdAt,
      );
}

Map<String, dynamic> _accountStateToJson(AccountState state) => {
      'id': state.id,
      'name': state.name,
      'balance': state.balance.toString(),
      'currency': state.currency,
    };

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
