import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_request.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_request.dart';
import 'package:fin_tamer/features/account/domain/models/account_response.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';

extension AccountDtoMapper on AccountDto {
  Account toDomain() => Account(
        id: id,
        userId: userId,
        name: name,
        balance: balance,
        currency: currency,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension AccountCreateRequestMapper on AccountCreateRequest {
  AccountCreateRequestDto toDto() => AccountCreateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountUpdateRequestMapper on AccountUpdateRequest {
  AccountUpdateRequestDto toDto() => AccountUpdateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountResponseDtoMapper on AccountResponseDto {
  AccountResponse toDomain() => AccountResponse(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
        incomeStats: incomeStats, // если нужны мапперы для stat, добавить
        expenseStats: expenseStats,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
