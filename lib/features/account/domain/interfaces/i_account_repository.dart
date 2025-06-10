import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_request.dart';
import 'package:fin_tamer/features/account/domain/models/account_response.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_request.dart';

abstract interface class IAccountRepository {
  Future<List<Account>> getAll();

  Future<AccountResponse?> getById(int id);

  Future<Account> create(AccountCreateRequest request);

  Future<Account?> update(int id, AccountUpdateRequest request);
}
