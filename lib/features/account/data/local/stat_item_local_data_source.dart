import 'package:fin_tamer/objectbox.g.dart';
import 'entities/stat_item_entity.dart';

class StatItemLocalDataSource {
  final Box<StatItemEntity> box;

  StatItemLocalDataSource(this.box);

  Future<List<StatItemEntity>> getByAccount(int accountApiId, {bool? isIncome}) async {
    final condition = isIncome == null ? StatItemEntity_.accountApiId.equals(accountApiId) : StatItemEntity_.accountApiId.equals(accountApiId) & StatItemEntity_.isIncome.equals(isIncome);
    final query = box.query(condition).build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<void> saveAll(List<StatItemEntity> items) async {
    box.putMany(items);
  }

  Future<void> save(StatItemEntity item) async {
    box.put(item);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }
}
