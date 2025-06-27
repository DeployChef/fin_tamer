import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/category/data/remote/mappers/category_mapper.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/account_brief_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';

extension AccountBriefDtoMapper on AccountBriefDto {
  AccountBrief toDomain() => AccountBrief(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountBriefToDtoMapper on AccountBrief {
  AccountBriefDto toDto() => AccountBriefDto(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension TransactionResponseDtoMapper on TransactionResponseDto {
  Transaction toDomain() => Transaction(
        id: id,
        account: account.toDomain(),
        category: category.toDomain(),
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension TransactionCreateDataMapper on TransactionCreateData {
  TransactionRequestDto toDto() => TransactionRequestDto(
        accountId: accountId,
        categoryId: categoryId,
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
      );
}

extension TransactionUpdateDataMapper on TransactionUpdateData {
  TransactionRequestDto toDto() => TransactionRequestDto(
        accountId: accountId,
        categoryId: categoryId,
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
      );
}
