import 'package:fin_tamer/features/account/data/mock_account_repository.dart';
import 'package:fin_tamer/features/category/data/mock_category_repository.dart';
import 'package:fin_tamer/features/transaction/data/mock_transaction_repository.dart';
import 'package:fin_tamer/features/transaction/domain/services/transaction_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/amount_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsList extends ConsumerWidget {
  TransactionsList.income({super.key}) : isIncome = true;
  TransactionsList.outcome({super.key}) : isIncome = false;

  final bool isIncome;
  final MockTransactionRepository repo = MockTransactionRepository(MockAccountRepository(), MockCategoryRepository());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionService = ref.watch(transactionServiceProvider(isIncome: isIncome));

    return transactionService.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Text("Error");
      },
      data: (transactions) {
        var amount = transactions.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);
        return Column(
          children: [
            AmountWidget(title: "Всего", amount: amount),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return Column(
                    children: [
                      TransactionItem(item: item),
                      const Divider(
                        height: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
