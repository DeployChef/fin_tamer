import 'dto/category_dto.dart';

class CategoryRemoteDataSource {
  final _db = [
    const CategoryDto(id: 1, name: 'Зарплата', emoji: '💰', isIncome: true),
    // const CategoryDto(id: 2, name: 'Аренда квартиры', emoji: '🛕', isIncome: false),
    // const CategoryDto(id: 3, name: 'Одежда', emoji: '👗', isIncome: false),
    // const CategoryDto(id: 4, name: 'На собачку', emoji: '🐶', isIncome: false),
    // const CategoryDto(id: 5, name: 'Ремонт квартиры', emoji: 'РК', isIncome: false),
    // const CategoryDto(id: 6, name: 'Продукты', emoji: '🎈', isIncome: false),
    // const CategoryDto(id: 7, name: 'Спортзал', emoji: '🏋️‍♀️', isIncome: false),
    // const CategoryDto(id: 8, name: 'Медицина', emoji: '💉', isIncome: false),
    // const CategoryDto(id: 9, name: 'Премия', emoji: '🍀', isIncome: true),
  ];

  Future<List<CategoryDto>> getAll() async {
    return _db;
  }

  Future<List<CategoryDto>> getByType(bool isIncome) async {
    return _db.where((c) => c.isIncome == isIncome).toList();
  }

  Future<CategoryDto?> getById(int id) async {
    return _db.where((c) => c.id == id).firstOrNull;
  }
}
