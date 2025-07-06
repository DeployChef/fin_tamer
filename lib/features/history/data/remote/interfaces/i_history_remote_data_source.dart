import '../dto/account_history_response_dto.dart';

abstract interface class IHistoryRemoteDataSource {
  Future<AccountHistoryResponseDto?> getAccountById(int apiId);
}
