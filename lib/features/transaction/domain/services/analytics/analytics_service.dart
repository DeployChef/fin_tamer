import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_filter_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:collection/collection.dart";
import 'package:fin_tamer/core/di/repository_providers.dart';

part 'analytics_service.g.dart';
part 'analytics_service.freezed.dart';

@Riverpod(dependencies: [AccountService, AnalyticsFilterService])
class AnalyticsService extends _$AnalyticsService {
  @override
  FutureOr<List<AnalyticsState>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);
    if (account == null) return [];

    final filter = ref.watch(analyticsFilterServiceProvider(isIncome: isIncome));
    final transactionRepo = await ref.watch(transactionRepositoryProvider.future);

    final transactions = await transactionRepo.getByPeriod(account.id, filter.startDate, filter.endDate);
    final filtered = transactions.where((c) => c.category.isIncome == isIncome).toList();
    final fullAmount = filtered.isNotEmpty ? filtered.map((c) => double.tryParse(c.amount) ?? 0.0).reduce((a, b) => a + b) : 0.0;
    final categoryMap = groupBy(filtered, (c) => c.category);

    final analytics = categoryMap.entries
        .map((e) {
          final amount = e.value.map((c) => double.tryParse(c.amount) ?? 0.0).reduce((a, b) => a + b);
          final last = e.value.lastOrNull;
          final percentage = fullAmount > 0 ? (amount / fullAmount) * 100 : 0.0;
          return last == null
              ? null
              : AnalyticsState(
                  category: e.key,
                  lastTransactionTitle: "${last.category.name} ${last.comment != null ? " ${last.comment}" : ""}",
                  transactions: e.value,
                  amount: amount,
                  percentage: percentage,
                );
        })
        .whereType<AnalyticsState>()
        .toList();
    return analytics;
  }
}

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    required Category category,
    required String lastTransactionTitle,
    required List<Transaction> transactions,
    required double amount,
    required double percentage,
  }) = _AnalyticsModel;
}
