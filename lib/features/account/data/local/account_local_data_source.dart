import 'package:objectbox/objectbox.dart';
import 'entities/account_entity.dart';

class AccountLocalDataSource {
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
}
