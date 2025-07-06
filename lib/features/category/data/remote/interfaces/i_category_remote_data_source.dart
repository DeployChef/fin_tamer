import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';

abstract interface class ICategoryRemoteDataSource {
  Future<List<CategoryDto>> getAll();
  Future<List<CategoryDto>> getByType(bool isIncome);
  Future<CategoryDto?> getById(int id);
}
