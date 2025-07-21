import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/features/category/data/local/category_local_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/category_repository.dart';
import 'package:fin_tamer/core/di/objectbox_providers.dart';
import 'package:fin_tamer/features/history/data/local/history_local_data_source.dart';
import 'package:fin_tamer/features/history/data/remote/interfaces/i_history_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/history_repository.dart';
import 'package:fin_tamer/features/history/data/local/entities/history_entity.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/account_repository.dart';
import 'package:fin_tamer/features/transaction/data/local/transaction_local_data_source.dart';
import 'package:fin_tamer/features/transaction/data/local/entities/transaction_entity.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/transaction_repository.dart';
import 'package:fin_tamer/core/di/network_providers.dart';
import 'package:fin_tamer/core/di/mock_providers.dart';
import 'package:fin_tamer/core/config/app_config.dart';
import 'package:fin_tamer/core/di/sync_providers.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
Future<CategoryLocalDataSource> categoryLocalDataSource(Ref ref) async {
  final box = await ref.watch(categoryBoxProvider.future);
  return CategoryLocalDataSource(box);
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
IHistoryRemoteDataSource historyRemoteDataSource(Ref ref) {
  if (AppConfig.useMockHistory) {
    return ref.watch(historyMockRemoteDataSourceProvider);
  } else {
    return ref.watch(historyApiRemoteDataSourceProvider);
  }
}

@Riverpod(keepAlive: true)
Future<HistoryRepository> historyRepository(Ref ref) async {
  final local = await ref.watch(historyLocalDataSourceProvider.future);
  final remote = ref.watch(historyRemoteDataSourceProvider);
  final localAccount = await ref.watch(accountLocalDataSourceProvider.future);
  return HistoryRepository(
    localDataSource: local,
    remoteDataSource: remote,
    accountLocalDataSource: localAccount,
  );
}

@Riverpod(keepAlive: true)
Future<IAccountLocalDataSource> accountLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<AccountEntity>();
  return AccountLocalDataSource(box);
}

@Riverpod(keepAlive: true)
Future<IStatItemLocalDataSource> statItemLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<StatItemEntity>();
  return StatItemLocalDataSource(box);
}

@Riverpod(keepAlive: true)
IAccountRemoteDataSource accountRemoteDataSource(Ref ref) {
  if (AppConfig.useMockAccounts) {
    return ref.watch(accountMockRemoteDataSourceProvider);
  } else {
    return ref.watch(accountApiRemoteDataSourceProvider);
  }
}

@Riverpod(keepAlive: true)
ITransactionRemoteDataSource transactionRemoteDataSource(Ref ref) {
  if (AppConfig.useMockTransactions) {
    return ref.watch(transactionMockRemoteDataSourceProvider);
  } else {
    return ref.watch(transactionApiRemoteDataSourceProvider);
  }
}

@Riverpod(keepAlive: true)
ICategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  if (AppConfig.useMockCategories) {
    return ref.watch(categoryMockRemoteDataSourceProvider);
  } else {
    return ref.watch(categoryApiRemoteDataSourceProvider);
  }
}

@Riverpod(keepAlive: true)
Future<AccountRepository> accountRepository(Ref ref) async {
  final local = await ref.watch(accountLocalDataSourceProvider.future);
  final statItem = await ref.watch(statItemLocalDataSourceProvider.future);
  final remote = ref.watch(accountRemoteDataSourceProvider);
  final syncService = await ref.watch(syncServiceProvider.future);
  return AccountRepository(
    localDataSource: local,
    statItemLocalDataSource: statItem,
    remoteDataSource: remote,
    syncService: syncService,
  );
}

@Riverpod(keepAlive: true)
Future<TransactionLocalDataSource> transactionLocalDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<TransactionEntity>();
  return TransactionLocalDataSource(box);
}

@Riverpod(keepAlive: true)
Future<TransactionRepository> transactionRepository(Ref ref) async {
  final local = await ref.watch(transactionLocalDataSourceProvider.future);
  final remote = ref.watch(transactionRemoteDataSourceProvider);
  final accountRepo = await ref.watch(accountRepositoryProvider.future);
  final categoryRepo = await ref.watch(categoryRepositoryProvider.future);
  final historyRepo = await ref.watch(historyRepositoryProvider.future);
  final syncService = await ref.watch(syncServiceProvider.future);
  return TransactionRepository(
    localDataSource: local,
    remoteDataSource: remote,
    accountRepository: accountRepo,
    categoryRepository: categoryRepo,
    historyRepository: historyRepo,
    syncService: syncService,
  );
}
