import 'package:fin_tamer/features/transaction/domain/services/transaction_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/amount_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsHistoryList extends ConsumerWidget {
  const TransactionsHistoryList.income({super.key}) : isIncome = true;
  const TransactionsHistoryList.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now().toUtc();
    final fromRequest = DateTime(now.year, now.month, now.day).add(const Duration(days: -10));
    final toRequest = DateTime(now.year, now.month, now.day).add(const Duration(days: 1)).add(const Duration(minutes: -1));

    final transactionService = ref.watch(transactionServiceProvider(
      isIncome: isIncome,
      startDate: fromRequest,
      endDate: toRequest,
    ));

    return Column(
      children: [
        AmountWidget(
            title: "Сумма",
            amount: transactionService.when(
              data: (transactions) => transactions.isNotEmpty ? transactions.map((c) => double.parse(c.amount)).reduce((a, b) => a + b) : 0.0,
              error: (_, __) => 0,
              loading: () => 0,
            )),
        const Divider(height: 1),
        Expanded(
          child: transactionService.when(
            data: (transactions) {
              return transactions.isEmpty
                  ? const Center(child: Text("Записи не найдены"))
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final item = transactions[index];
                        return Column(
                          children: [
                            TransactionItem(
                              item: item,
                              showTime: true,
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                        );
                      },
                    );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const Center(child: Text("Error")),
          ),
        ),
      ],
    );
  }
}
