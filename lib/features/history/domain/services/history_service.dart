import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_service.g.dart';

@riverpod
class HistoryService extends _$HistoryService {
  @override
  FutureOr<AccountHistoryFeed?> build(int id) async {
    final repo = await ref.watch(historyRepositoryProvider.future);
    final feed = await repo.getAccountById(id);
    return feed;
  }
}
