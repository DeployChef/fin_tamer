import 'package:fin_tamer/features/category/domain/models/category.dart';

abstract interface class ICategoryRepository {
  Future<List<Category>> getAll();

  Future<List<Category>> getByType(bool isIncome);
}
