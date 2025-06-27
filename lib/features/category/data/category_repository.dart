import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'remote/category_remote_data_source.dart';
import 'remote/mappers/category_mapper.dart';

class CategoryRepository implements ICategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepository(this.remoteDataSource);

  @override
  Future<List<Category>> getAll() async {
    final dtos = await remoteDataSource.getAll();
    return dtos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Category>> getByType(bool isIncome) async {
    final dtos = await remoteDataSource.getByType(isIncome);
    return dtos.map((e) => e.toDomain()).toList();
  }
}
