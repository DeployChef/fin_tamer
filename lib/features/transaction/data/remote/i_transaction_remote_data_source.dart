import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';

abstract class ITransactionRemoteDataSource {
  Future<TransactionDto> create(TransactionRequestDto request);
  Future<TransactionResponseDto?> update(int id, TransactionRequestDto request);
  Future<void> delete(int id);
  Future<TransactionResponseDto?> getById(int id);
  Future<List<TransactionResponseDto>> getByPeriod(int accountId, DateTime startDate, DateTime endDate);
}
