import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/core/network/api_service.dart';

class RemoteAccountDataSource implements IAccountRemoteDataSource {
  final ApiService _apiService;

  RemoteAccountDataSource(this._apiService);

  @override
  Future<List<AccountDto>> getAll() async {
    final response = await _apiService.get<List<dynamic>>('/accounts');
    return response.map((json) => AccountDto.fromJson(json)).toList();
  }

  @override
  Future<AccountDto> create(AccountCreateRequestDto request) async {
    final response = await _apiService.post<Map<String, dynamic>>(
      '/accounts',
      data: request.toJson(),
    );
    return AccountDto.fromJson(response);
  }

  @override
  Future<AccountResponseDto?> getResponseById(int id) async {
    try {
      final response = await _apiService.get<Map<String, dynamic>>('/accounts/$id');
      return AccountResponseDto.fromJson(response);
    } catch (e) {
      // Если счет не найден, возвращаем null
      return null;
    }
  }

  @override
  Future<AccountDto?> getById(int id) async {
    try {
      final response = await _apiService.get<Map<String, dynamic>>('/accounts/$id');
      return AccountDto.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AccountDto?> update(int id, AccountUpdateRequestDto request) async {
    try {
      final response = await _apiService.put<Map<String, dynamic>>(
        '/accounts/$id',
        data: request.toJson(),
      );
      return AccountDto.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}
