import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/history/data/remote/dto/account_history_response_dto.dart';
import 'package:fin_tamer/features/history/data/remote/interfaces/i_history_remote_data_source.dart';
import 'package:fin_tamer/core/utils/isolate_deserializer.dart';

class HistoryApiRemoteDataSource implements IHistoryRemoteDataSource {
  final ApiService _apiService;

  HistoryApiRemoteDataSource(this._apiService);

  @override
  Future<AccountHistoryResponseDto?> getAccountById(int apiId) async {
    try {
      final response =
          await _apiService.get<String>('/accounts/$apiId/history');
      return await IsolateDeserializer.deserialize<AccountHistoryResponseDto>(
        response,
        AccountHistoryResponseDto.fromJson,
      );
    } catch (e) {
      // Если история не найдена, возвращаем null
      return null;
    }
  }
}
