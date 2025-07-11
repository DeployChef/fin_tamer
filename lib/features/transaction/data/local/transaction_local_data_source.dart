import 'package:fin_tamer/objectbox.g.dart';
import 'entities/transaction_entity.dart';

class TransactionLocalDataSource {
  final Box<TransactionEntity> box;

  TransactionLocalDataSource(this.box);

  Future<List<TransactionEntity>> getAll() async {
    return box.getAll();
  }

  Future<TransactionEntity?> getById(int id) async {
    return box.get(id);
  }

  Future<List<TransactionEntity>> getByAccount(int accountApiId) async {
    final query =
        box.query(TransactionEntity_.accountApiId.equals(accountApiId)).build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<void> saveAll(List<TransactionEntity> items) async {
    box.putMany(items);
  }

  Future<int> save(TransactionEntity item) async {
    return box.put(item);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }

  Future<void> deleteByApiId(int apiId) async {
    final query = box.query(TransactionEntity_.apiId.equals(apiId)).build();
    final results = query.find();
    for (final entity in results) {
      box.remove(entity.id);
    }
    query.close();
  }

  Future<TransactionEntity?> getByApiId(int apiId) async {
    final query = box.query(TransactionEntity_.apiId.equals(apiId)).build();
    final result = query.findFirst();
    query.close();
    return result;
  }
}
