import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'account_brief_dto.dart';
import 'package:fin_tamer/features/transaction/data/local/entities/transaction_entity.dart';

part 'transaction_response_dto.freezed.dart';
part 'transaction_response_dto.g.dart';

@freezed
abstract class TransactionResponseDto with _$TransactionResponseDto {
  const TransactionResponseDto._();

  const factory TransactionResponseDto({
    required int id,
    required AccountBriefDto account,
    required CategoryDto category,
    required String amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionResponseDto;

  factory TransactionResponseDto.fromJson(Map<String, dynamic> json) => _$TransactionResponseDtoFromJson(json);
}

extension TransactionResponseDtoToEntity on TransactionResponseDto {
  TransactionEntity toEntity() => TransactionEntity(
        id: 0,
        apiId: id,
        accountApiId: account.id,
        categoryApiId: category.id,
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
