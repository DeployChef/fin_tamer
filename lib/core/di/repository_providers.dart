import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/features/category/data/local/category_local_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/category_repository.dart';
import 'package:fin_tamer/core/di/objectbox_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
Future<CategoryLocalDataSource> categoryLocalDataSource(Ref ref) async {
  final box = await ref.watch(categoryBoxProvider.future);
  return CategoryLocalDataSource(box);
}

@Riverpod(keepAlive: true)
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSource();
}

@Riverpod(keepAlive: true)
Future<CategoryRepository> categoryRepository(Ref ref) async {
  final local = await ref.watch(categoryLocalDataSourceProvider.future);
  final remote = ref.watch(categoryRemoteDataSourceProvider);
  return CategoryRepository(
    localDataSource: local,
    remoteDataSource: remote,
  );
}
