import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';

abstract interface class IAccountRepository {
  Future<List<Account>> getAll();

  Future<Account?> getById(int id);

  Future<Account?> getByApiId(int apiId);

  Future<Account> create(AccountCreateData data);

  Future<Account?> update(AccountUpdateData data);

  Future<void> updateLocalBalance(int accountId, double newBalance);
}
