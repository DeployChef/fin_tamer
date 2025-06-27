import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/stat_item_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';

extension AccountDtoMapper on AccountResponseDto {
  Account toDomain() => Account(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
        incomeStats: incomeStats.map((e) => e.toDomain()).toList(),
        expenseStats: expenseStats.map((e) => e.toDomain()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension AccountDtoToDomain on AccountDto {
  Account toDomain() => Account(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
        incomeStats: const [],
        expenseStats: const [],
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension StatItemDtoMapper on StatItemDto {
  StatItem toDomain() => StatItem(
        id: id,
        name: name,
        value: value,
      );
}

extension AccountCreateDataMapper on AccountCreateData {
  AccountCreateRequestDto toDto() => AccountCreateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountUpdateDataMapper on AccountUpdateData {
  AccountUpdateRequestDto toDto() => AccountUpdateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}
