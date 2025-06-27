import 'package:fin_tamer/features/account/data/account_repository.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/transaction/data/transaction_repository.dart';
import 'package:fin_tamer/features/transaction/data/remote/mock_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/domain/interfaces/i_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_tamer/features/category/data/category_repository.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';

part 'today_transaction_service.g.dart';

@Riverpod(dependencies: [AccountService])
class TodayTransactionService extends _$TodayTransactionService {
  static final ITransactionRepository transactionRepo = TransactionRepository(
    MockTransactionRemoteDataSource(
      MockRemoteAccountDataSource(),
      CategoryRemoteDataSource(),
    ),
  );

  @override
  FutureOr<List<Transaction>> build({required bool isIncome}) async {
    final account = await ref.watch(accountServiceProvider.future);

    if (account == null) return [];

    final now = DateTime.now().toUtc();
    final fromRequest = DateTime(now.year, now.month, now.day);
    final toRequest = fromRequest.add(const Duration(days: 1)).add(const Duration(minutes: -1));

    final transactions = await transactionRepo.getByPeriod(account.id, fromRequest, toRequest);

    return transactions.where((c) => c.category.isIncome == isIncome).toList();
  }
}
