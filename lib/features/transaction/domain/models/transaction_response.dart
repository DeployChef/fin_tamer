import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/transaction/domain/models/account_brief_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const TransactionResponse._();

  const factory TransactionResponse({
    required int id,
    required AccountBriefDto account,
    required Category category,
    required String amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);
}
