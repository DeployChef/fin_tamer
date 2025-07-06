import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_service.g.dart';

@Riverpod(keepAlive: true)
class CategoriesService extends _$CategoriesService {
  @override
  FutureOr<List<Category>> build() async {
    final repo = await ref.watch(categoryRepositoryProvider.future);
    return repo.getAll();
  }
}
