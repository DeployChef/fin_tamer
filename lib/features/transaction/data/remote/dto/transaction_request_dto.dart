import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request_dto.freezed.dart';
part 'transaction_request_dto.g.dart';

@freezed
abstract class TransactionRequestDto with _$TransactionRequestDto {
  const TransactionRequestDto._();

  const factory TransactionRequestDto({
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    String? comment,
  }) = _TransactionRequestDto;

  factory TransactionRequestDto.fromJson(Map<String, dynamic> json) => _$TransactionRequestDtoFromJson(json);
}
