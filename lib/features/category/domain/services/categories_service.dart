import 'package:fin_tamer/features/category/data/category_repository.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';
import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_service.g.dart';

@riverpod
class CategoriesService extends _$CategoriesService {
  static final ICategoryRepository categoryRepository = CategoryRepository(CategoryRemoteDataSource());

  @override
  FutureOr<List<Category>> build() async {
    return await categoryRepository.getAll();
  }
}
