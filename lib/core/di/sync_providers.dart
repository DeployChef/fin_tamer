import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_tamer/core/event_sourcing/sync_event_data_source.dart';
import 'package:fin_tamer/core/event_sourcing/sync_account_handler.dart';
import 'package:fin_tamer/core/event_sourcing/sync_transaction_handler.dart';
import 'package:fin_tamer/core/event_sourcing/sync_service.dart';
import 'package:fin_tamer/core/di/objectbox_providers.dart';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';

part 'sync_providers.g.dart';

@Riverpod(keepAlive: true)
Future<SyncEventDataSource> syncEventDataSource(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  final box = store.box<SyncEvent>();
  return SyncEventDataSource(box);
}

@Riverpod(keepAlive: true)
SyncAccountHandler syncAccountHandler(Ref ref) {
  final remote = ref.watch(accountRemoteDataSourceProvider);
  return SyncAccountHandler(remote);
}

@Riverpod(keepAlive: true)
SyncTransactionHandler syncTransactionHandler(Ref ref) {
  final remote = ref.watch(transactionRemoteDataSourceProvider);
  final localAsync = ref.watch(transactionLocalDataSourceProvider);
  final local = localAsync.maybeWhen(data: (value) => value, orElse: () => throw Exception('TransactionLocalDataSource not ready'));
  return SyncTransactionHandler(remote, local);
}

@Riverpod(keepAlive: true)
Future<ISyncService> syncService(Ref ref) async {
  final eventDataSource = await ref.watch(syncEventDataSourceProvider.future);
  final accountHandler = ref.watch(syncAccountHandlerProvider);
  final transactionHandler = ref.watch(syncTransactionHandlerProvider);
  return SyncService(eventDataSource, accountHandler, transactionHandler);
}
