import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/account_brief_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
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

extension TransactionUpdateDataMapper on TransactionUpdateData {
  TransactionRequestDto toDto() => TransactionRequestDto(
        accountId: accountId,
        categoryId: categoryId,
        amount: amount.toString(),
        transactionDate: transactionDate.toUtc(),
        comment: comment,
      );
}
