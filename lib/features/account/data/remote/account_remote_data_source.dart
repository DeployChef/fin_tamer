import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/core/utils/isolate_deserializer.dart';

class RemoteAccountDataSource implements IAccountRemoteDataSource {
  final ApiService _apiService;

  RemoteAccountDataSource(this._apiService);

  @override
  Future<List<AccountDto>> getAll() async {
    final response = await _apiService.get<String>('/accounts');
    return await IsolateDeserializer.deserializeList<AccountDto>(
      response,
      AccountDto.fromJson,
    );
  }

  @override
  Future<AccountDto> create(AccountCreateRequestDto request) async {
    final response = await _apiService.post<String>(
      '/accounts',
      data: request.toJson(),
    );
    return await IsolateDeserializer.deserialize<AccountDto>(
      response,
      AccountDto.fromJson,
    );
  }

  @override
  Future<AccountResponseDto?> getResponseById(int id) async {
    try {
      final response = await _apiService.get<String>('/accounts/$id');
      return await IsolateDeserializer.deserialize<AccountResponseDto>(
        response,
        AccountResponseDto.fromJson,
      );
    } catch (e) {
      // Если счет не найден, возвращаем null
      return null;
    }
  }

  @override
  Future<AccountDto?> getById(int id) async {
    try {
      final response = await _apiService.get<String>('/accounts/$id');
      return await IsolateDeserializer.deserialize<AccountDto>(
        response,
        AccountDto.fromJson,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AccountDto?> update(int id, AccountUpdateRequestDto request) async {
    try {
      final response = await _apiService.put<String>(
        '/accounts/$id',
        data: request.toJson(),
      );
      return await IsolateDeserializer.deserialize<AccountDto>(
        response,
        AccountDto.fromJson,
      );
    } catch (e) {
      return null;
    }
  }
}
