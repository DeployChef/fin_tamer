import 'dart:async';

import 'package:fin_tamer/features/account/data/mock_account_repository.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/category/data/mock_category_repository.dart';
import 'package:fin_tamer/features/transaction/data/mock_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/transaction/domain/services/history_filter_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_transaction_service.g.dart';

@Riverpod(dependencies: [AccountService, HistoryFilterService])
class FilteredTransactionService extends _$FilteredTransactionService {
  static final ITransactionRepository transactionRepo = MockTransactionRepository(MockAccountRepository(), MockCategoryRepository());

  @override
  FutureOr<List<TransactionResponse>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);

    if (account == null) return [];

    final filter = ref.watch(historyFilterServiceProvider(isIncome: isIncome));
    final transactions = await transactionRepo.getByPeriod(account.id, filter.startDate, filter.endDate);

    final filtered = transactions.where((c) => c.category.isIncome == isIncome).toList();

    filtered.sort((a, b) => switch (filter.sortType) {
          SortType.amount => a.amount.compareTo(b.amount),
          SortType.date => a.transactionDate.compareTo(b.transactionDate),
        });

    return filtered;
  }
}
