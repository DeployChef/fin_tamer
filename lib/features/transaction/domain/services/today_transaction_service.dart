import 'package:fin_tamer/features/account/data/mock_account_repository.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/category/data/mock_category_repository.dart';
import 'package:fin_tamer/features/transaction/data/mock_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_transaction_service.g.dart';

@Riverpod(dependencies: [AccountService])
class TodayTransactionService extends _$TodayTransactionService {
  static final ITransactionRepository transactionRepo = MockTransactionRepository(MockAccountRepository(), MockCategoryRepository());

  @override
  FutureOr<List<TransactionResponse>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);

    if (account == null) return [];

    final now = DateTime.now().toUtc();
    final fromRequest = DateTime(now.year, now.month, now.day);
    final toRequest = fromRequest.add(const Duration(days: 1)).add(const Duration(minutes: -1));

    final transactions = await transactionRepo.getByPeriod(account.id, fromRequest, toRequest);

    return transactions.where((c) => c.category.isIncome == isIncome).toList();
  }
}
