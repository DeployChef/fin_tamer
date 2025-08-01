import 'entities/account_entity.dart';
import 'package:fin_tamer/objectbox.g.dart';

abstract class IAccountLocalDataSource {
  Future<List<AccountEntity>> getAll();
  Future<AccountEntity?> getById(int id);
  Future<void> saveAll(List<AccountEntity> items);
  Future<void> save(AccountEntity item);
  Future<void> delete(int id);
  Future<AccountEntity?> getByApiId(int apiId);
}

class AccountLocalDataSource implements IAccountLocalDataSource {
  final Box<AccountEntity> box;

  AccountLocalDataSource(this.box);

  Future<List<AccountEntity>> getAll() async {
    return box.getAll();
  }

  Future<AccountEntity?> getById(int id) async {
    return box.get(id);
  }

  Future<void> saveAll(List<AccountEntity> items) async {
    box.putMany(items);
  }

  Future<void> save(AccountEntity item) async {
    box.put(item);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }

  Future<AccountEntity?> getByApiId(int apiId) async {
    final query = box.query(AccountEntity_.apiId.equals(apiId)).build();
    final result = query.findFirst();
    query.close();
    return result;
  }
}
