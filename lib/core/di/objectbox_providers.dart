import 'package:fin_tamer/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/core/local/objectbox_store.dart';
import 'package:objectbox/objectbox.dart';
import 'package:fin_tamer/features/category/data/local/entities/category_entity.dart';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';

part 'objectbox_providers.g.dart';

@Riverpod(keepAlive: true)
Future<Store> objectBoxStore(Ref ref) async {
  return createObjectBoxStore();
}

@Riverpod(keepAlive: true)
Future<Box<CategoryEntity>> categoryBox(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  return store.box<CategoryEntity>();
}

@Riverpod(keepAlive: true)
Future<Box<SyncEvent>> syncEventBox(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  return store.box<SyncEvent>();
}
