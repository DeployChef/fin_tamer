import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_chart_service.g.dart';

/// Режим отображения графика
enum TransactionChartMode { byDay, byMonth }

@riverpod
class TransactionChartService extends _$TransactionChartService {
  TransactionChartMode _mode = TransactionChartMode.byDay;

  @override
  Future<List<Transaction>> build() async {
    final account = await ref.watch(accountServiceProvider.future);
    if (account == null) return [];
    return _fetchTransactions(account.id);
  }

  Future<void> setMode(TransactionChartMode mode) async {
    _mode = mode;
    state = const AsyncValue.loading();
    final account = await ref.watch(accountServiceProvider.future);
    if (account == null) {
      state = const AsyncValue.data([]);
      return;
    }
    state = await AsyncValue.guard(() => _fetchTransactions(account.id));
  }

  Future<List<Transaction>> _fetchTransactions(int accountId) async {
    final repo = await ref.read(transactionRepositoryProvider.future);
    final now = DateTime.now();
    if (_mode == TransactionChartMode.byDay) {
      final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
      final from = DateTime(now.year, now.month, 1);
      final to = DateTime(now.year, now.month, daysInMonth, 23, 59, 59);
      return await repo.getByPeriod(accountId, from, to);
    } else {
      // byMonth: только текущий год
      final from = DateTime(now.year, 1, 1);
      final to = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
      return await repo.getByPeriod(accountId, from, to);
    }
  }
}
