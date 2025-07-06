import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/history/data/local/entities/history_entity.dart';
import 'package:fin_tamer/features/transaction/data/local/entities/transaction_entity.dart';
import 'package:fin_tamer/objectbox.g.dart';
import 'package:flutter/foundation.dart';
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
  if (kDebugMode) {
    store.box<TransactionEntity>().removeAll();
    store.box<StatItemEntity>().removeAll();
    store.box<CategoryEntity>().removeAll();
    store.box<AccountEntity>().removeAll();
    store.box<HistoryEntity>().removeAll();
  }
  return store.box<CategoryEntity>();
}
