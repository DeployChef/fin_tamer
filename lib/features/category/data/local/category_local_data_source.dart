import 'package:fin_tamer/objectbox.g.dart';
import 'entities/category_entity.dart';

class CategoryLocalDataSource {
  final Box<CategoryEntity> box;

  CategoryLocalDataSource(this.box);

  Future<List<CategoryEntity>> getAll() async {
    return box.getAll();
  }

  Future<CategoryEntity?> getById(int id) async {
    return box.get(id);
  }

  Future<List<CategoryEntity>> getByType(bool isIncome) async {
    final query = box.query(CategoryEntity_.isIncome.equals(isIncome)).build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<void> saveAll(List<CategoryEntity> categories) async {
    box.putMany(categories);
  }

  Future<void> save(CategoryEntity category) async {
    box.put(category);
  }

  Future<void> delete(int id) async {
    box.remove(id);
  }
}
