import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/data/remote/remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/mappers/account_mapper.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';

class AccountRepository implements IAccountRepository {
  final MockRemoteAccountDataSource remoteDataSource;

  AccountRepository(this.remoteDataSource);

  @override
  Future<List<Account>> getAll() async {
    final dtos = await remoteDataSource.getAll();
    return dtos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<Account?> getById(int id) async {
    final dto = await remoteDataSource.getById(id);
    return dto?.toDomain();
  }

  @override
  Future<Account> create(AccountCreateData data) async {
    final dto = await remoteDataSource.create(data.toDto());
    return dto.toDomain();
  }

  @override
  Future<Account?> update(AccountUpdateData data) async {
    final dto = await remoteDataSource.update(data.id, data.toDto());
    return dto?.toDomain();
  }
}
