import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_response_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:intl/intl.dart';
import 'package:fin_tamer/core/utils/isolate_deserializer.dart';

class TransactionRemoteDataSource implements ITransactionRemoteDataSource {
  final ApiService _apiService;

  TransactionRemoteDataSource(this._apiService);

  @override
  Future<TransactionDto> create(TransactionRequestDto request) async {
    final response = await _apiService.post<String>(
      '/transactions',
      data: request.toJson(),
    );
    return await IsolateDeserializer.deserialize<TransactionDto>(
      response,
      TransactionDto.fromJson,
    );
  }

  @override
  Future<TransactionResponseDto?> update(
      int id, TransactionRequestDto request) async {
    try {
      final response = await _apiService.put<String>(
        '/transactions/$id',
        data: request.toJson(),
      );
      return await IsolateDeserializer.deserialize<TransactionResponseDto>(
        response,
        TransactionResponseDto.fromJson,
      );
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
      final response = await _apiService.get<String>('/transactions/$id');
      return await IsolateDeserializer.deserialize<TransactionResponseDto>(
        response,
        TransactionResponseDto.fromJson,
      );
    } catch (e) {
      // Если транзакция не найдена, возвращаем null
      return null;
    }
  }

  @override
  Future<List<TransactionResponseDto>> getByPeriod(
      int accountId, DateTime startDate, DateTime endDate) async {
    try {
      final from = DateFormat('yyyy-MM-dd').format(startDate);
      final to = DateFormat('yyyy-MM-dd').format(endDate);

      final response = await _apiService.get<String>(
        '/transactions/account/$accountId/period',
        queryParameters: {
          'startDate': from,
          'endDate': to,
        },
      );
      return await IsolateDeserializer.deserializeList<TransactionResponseDto>(
        response,
        TransactionResponseDto.fromJson,
      );
    } catch (e) {
      return [];
    }
  }
}
