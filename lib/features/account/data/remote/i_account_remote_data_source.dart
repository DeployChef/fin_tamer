import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';

abstract class IAccountRemoteDataSource {
  Future<List<AccountDto>> getAll();
  Future<AccountDto> create(AccountCreateRequestDto request);
  Future<AccountResponseDto?> getResponseById(int id);
  Future<AccountDto?> getById(int id);
  Future<AccountDto?> update(int id, AccountUpdateRequestDto request);
}
