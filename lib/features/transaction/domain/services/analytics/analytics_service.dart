import 'package:fin_tamer/features/account/data/mock_account_repository.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/category/data/mock_category_repository.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/transaction/data/mock_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_filter_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:collection/collection.dart";

part 'analytics_service.g.dart';
part 'analytics_service.freezed.dart';

@Riverpod(dependencies: [AccountService, AnalyticsFilterService])
class AnalyticsService extends _$AnalyticsService {
  static final ITransactionRepository transactionRepo = MockTransactionRepository(MockAccountRepository(), MockCategoryRepository());

  @override
  FutureOr<List<AnalyticsState>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);

    if (account == null) return [];

    final filter = ref.watch(analyticsFilterServiceProvider(isIncome: isIncome));
    final transactions = await transactionRepo.getByPeriod(account.id, filter.startDate, filter.endDate);

    final filtered = transactions.where((c) => c.category.isIncome == isIncome).toList();

    final fullAmount = filtered.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);

    final categoryMap = groupBy(filtered, (c) => c.category);

    final analytics = categoryMap.entries.map((e) {
      final amount = e.value.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);
      final last = e.value.last;
      final percentage = (amount / fullAmount) * 100;

      return AnalyticsState(
        category: e.key,
        lastTransactionTitle: "${last.category.name}${last.comment != null ? " ${last.comment}" : ""}",
        transactions: e.value,
        amount: amount,
        percentage: percentage,
      );
    }).toList();

    return analytics;
  }
}

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    required Category category,
    required String lastTransactionTitle,
    required List<TransactionResponse> transactions,
    required double amount,
    required double percentage,
  }) = _AnalyticsModel;
}
