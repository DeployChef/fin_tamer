import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';

class MockCategoryRepository implements ICategoryRepository {
  final _db = [
    Category.fromJson({"id": 1, "name": "Зарплата", "emoji": "💰", "isIncome": true}),
    Category.fromJson({"id": 2, "name": "Аренда квартиры", "emoji": "🛕", "isIncome": false}),
    Category.fromJson({"id": 3, "name": "Одежда", "emoji": "👗", "isIncome": false}),
    Category.fromJson({"id": 4, "name": "На собачку", "emoji": "🐶", "isIncome": false}),
    Category.fromJson({"id": 5, "name": "Ремонт квартиры", "emoji": "РК", "isIncome": false}),
    Category.fromJson({"id": 6, "name": "Продукты", "emoji": "🎈", "isIncome": false}),
    Category.fromJson({"id": 7, "name": "Спортзал", "emoji": "🏋️‍♀️", "isIncome": false}),
    Category.fromJson({"id": 8, "name": "Медицина", "emoji": "💉", "isIncome": false}),
    Category.fromJson({"id": 9, "name": "Премия", "emoji": "🍀", "isIncome": true}),
  ];

  @override
  Future<List<Category>> getAll() async {
    return _db;
  }

  @override
  Future<List<Category>> getByType(bool isIncome) async {
    return _db.where((c) => c.isIncome == isIncome).toList();
  }
}
