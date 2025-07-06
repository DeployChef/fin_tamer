import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';

class TransactionRemoteDataSource implements ITransactionRemoteDataSource {
  final ApiService _apiService;

  TransactionRemoteDataSource(this._apiService);

  @override
  Future<TransactionResponseDto> create(TransactionRequestDto request) async {
    final response = await _apiService.post('/transactions', data: request.toJson());
    return TransactionResponseDto.fromJson(response.data);
  }

  @override
  Future<TransactionResponseDto?> update(int id, TransactionRequestDto request) async {
    try {
      final response = await _apiService.put('/transactions/$id', data: request.toJson());
      return TransactionResponseDto.fromJson(response.data);
    } catch (e) {
      // Если транзакция не найдена, возвращаем null
      return null;
    }
  }

  @override
  Future<void> delete(int id) async {
    await _apiService.delete('/transactions/$id');
  }

  @override
  Future<TransactionResponseDto?> getById(int id) async {
    try {
      final response = await _apiService.get('/transactions/$id');
      return TransactionResponseDto.fromJson(response.data);
    } catch (e) {
      // Если транзакция не найдена, возвращаем null
      return null;
    }
  }

  @override
  Future<List<TransactionResponseDto>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    final response = await _apiService.get('/transactions', queryParameters: {
      'accountId': accountId.toString(),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    });
    final List<dynamic> data = response.data;
    return data.map((json) => TransactionResponseDto.fromJson(json)).toList();
  }
}
