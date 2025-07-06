import 'dto/transaction_response_dto.dart';
import 'dto/transaction_request_dto.dart';

abstract class ITransactionRemoteDataSource {
  Future<TransactionResponseDto> create(TransactionRequestDto request);
  Future<TransactionResponseDto?> update(int id, TransactionRequestDto request);
  Future<void> delete(int id);
  Future<TransactionResponseDto?> getById(int id);
  Future<List<TransactionResponseDto>> getByPeriod(int accountId, DateTime startDate, DateTime endDate);
}
