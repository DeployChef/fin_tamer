import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:intl/intl.dart';

class TransactionRemoteDataSource implements ITransactionRemoteDataSource {
  final ApiService _apiService;

  TransactionRemoteDataSource(this._apiService);

  @override
  Future<TransactionDto> create(TransactionRequestDto request) async {
    final Map<String, dynamic> data = await _apiService.post<Map<String, dynamic>>('/transactions', data: request.toJson());
    return TransactionDto.fromJson(data);
  }

  @override
  Future<TransactionResponseDto?> update(int id, TransactionRequestDto request) async {
    try {
      final Map<String, dynamic> data = await _apiService.put<Map<String, dynamic>>('/transactions/$id', data: request.toJson());
      return TransactionResponseDto.fromJson(data);
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
      final Map<String, dynamic> data = await _apiService.get<Map<String, dynamic>>('/transactions/$id');
      return TransactionResponseDto.fromJson(data);
    } catch (e) {
      // Если транзакция не найдена, возвращаем null
      return null;
    }
  }

  @override
  Future<List<TransactionResponseDto>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    try {
      final from = DateFormat('yyyy-MM-dd').format(startDate);
      final to = DateFormat('yyyy-MM-dd').format(endDate);

      final List<dynamic> data = await _apiService.get<List<dynamic>>(
        '/transactions/account/$accountId/period',
        queryParameters: {
          'startDate': from,
          'endDate': to,
        },
      );
      return data.map((json) => TransactionResponseDto.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
