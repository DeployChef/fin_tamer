import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/features/category/data/local/category_local_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/category_repository.dart';
import 'package:fin_tamer/core/di/objectbox_providers.dart';
import 'package:fin_tamer/features/history/data/local/history_local_data_source.dart';
import 'package:fin_tamer/features/history/data/remote/history_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/history_repository.dart';
import 'package:fin_tamer/features/history/data/local/entities/history_entity.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/account_repository.dart';

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

@Riverpod(keepAlive: true)
Future<HistoryLocalDataSource> historyLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<HistoryEntity>();
  return HistoryLocalDataSource(box);
}

@Riverpod(keepAlive: true)
HistoryRemoteDataSource historyRemoteDataSource(Ref ref) {
  return HistoryRemoteDataSource();
}

@Riverpod(keepAlive: true)
Future<HistoryRepository> historyRepository(Ref ref) async {
  final local = await ref.watch(historyLocalDataSourceProvider.future);
  final remote = ref.watch(historyRemoteDataSourceProvider);
  return HistoryRepository(
    localDataSource: local,
    remoteDataSource: remote,
  );
}

@Riverpod(keepAlive: true)
Future<AccountLocalDataSource> accountLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<AccountEntity>();
  return AccountLocalDataSource(box);
}

@Riverpod(keepAlive: true)
Future<StatItemLocalDataSource> statItemLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<StatItemEntity>();
  return StatItemLocalDataSource(box);
}

@Riverpod(keepAlive: true)
MockRemoteAccountDataSource accountRemoteDataSource(Ref ref) {
  return MockRemoteAccountDataSource();
}

@Riverpod(keepAlive: true)
Future<AccountRepository> accountRepository(Ref ref) async {
  final local = await ref.watch(accountLocalDataSourceProvider.future);
  final statItem = await ref.watch(statItemLocalDataSourceProvider.future);
  final remote = ref.watch(accountRemoteDataSourceProvider);
  return AccountRepository(
    localDataSource: local,
    statItemLocalDataSource: statItem,
    remoteDataSource: remote,
  );
}
