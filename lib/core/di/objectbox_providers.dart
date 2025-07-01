import 'package:fin_tamer/features/history/data/local/entities/history_entity.dart';
import 'package:fin_tamer/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/core/local/objectbox_store.dart';
import 'package:objectbox/objectbox.dart';
import 'package:fin_tamer/features/category/data/local/entities/category_entity.dart';

part 'objectbox_providers.g.dart';

@Riverpod(keepAlive: true)
Future<Store> objectBoxStore(Ref ref) async {
  return createObjectBoxStore();
}

@Riverpod(keepAlive: true)
Future<Box<CategoryEntity>> categoryBox(Ref ref) async {
  final store = await ref.watch(objectBoxStoreProvider.future);
  store.box<HistoryEntity>().removeAll();
  return store.box<CategoryEntity>();
}
