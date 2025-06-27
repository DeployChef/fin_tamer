import 'package:objectbox/objectbox.dart';
import 'entities/history_entity.dart';

class HistoryLocalDataSource {
  final Box<HistoryEntity> box;

  HistoryLocalDataSource(this.box);

  Future<List<HistoryEntity>> getAll() async {
    return box.getAll();
  }

  Future<HistoryEntity?> getById(int id) async {
    return box.get(id);
  }

  Future<void> saveAll(List<HistoryEntity> items) async {
    box.putMany(items);
  }

  Future<void> save(HistoryEntity item) async {
    box.put(item);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }
}
