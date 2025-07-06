import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/history/data/remote/dto/account_history_response_dto.dart';
import 'package:fin_tamer/features/history/data/remote/interfaces/i_history_remote_data_source.dart';

class HistoryApiRemoteDataSource implements IHistoryRemoteDataSource {
  final ApiService _apiService;

  HistoryApiRemoteDataSource(this._apiService);

  @override
  Future<AccountHistoryResponseDto?> getAccountById(int apiId) async {
    try {
      final Map<String, dynamic> data = await _apiService.get<Map<String, dynamic>>('/accounts/$apiId/history');
      return AccountHistoryResponseDto.fromJson(data);
    } catch (e) {
      // Если история не найдена, возвращаем null
      return null;
    }
  }
}
