import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/category/domain/services/categories_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_categories.g.dart';

@Riverpod(dependencies: [CategoriesService])
class FilteredCategories extends _$FilteredCategories {
  @override
  FutureOr<List<Category>> build() async {
    final categories = await ref.watch(categoriesServiceProvider.future);
    return categories;
  }

  Future<void> setFilter(String text) async {
    final categories = await ref.watch(categoriesServiceProvider.future);
    final filtered = categories.where((c) => c.name.toLowerCase().contains(text.toLowerCase())).toList();
    state = AsyncData(filtered);
  }
}
