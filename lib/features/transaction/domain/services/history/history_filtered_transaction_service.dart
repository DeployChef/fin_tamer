import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/services/history/history_filter_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_tamer/core/di/repository_providers.dart';

part 'history_filtered_transaction_service.g.dart';

@Riverpod(dependencies: [AccountService, HistoryFilterService])
class HistoryFilteredTransactionService extends _$HistoryFilteredTransactionService {
  @override
  FutureOr<List<Transaction>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);
    if (account == null) return [];

    final filter = ref.watch(historyFilterServiceProvider(isIncome: isIncome));
    final transactionRepo = await ref.watch(transactionRepositoryProvider.future);

    final transactions = await transactionRepo.getByPeriod(account.id, filter.startDate, filter.endDate);
    final filtered = transactions.where((c) => c.category.isIncome == isIncome).toList();
    filtered.sort((a, b) => switch (filter.sortType) {
          SortType.amount => a.amount.compareTo(b.amount),
          SortType.date => a.transactionDate.compareTo(b.transactionDate),
        });
    return filtered;
  }
}
