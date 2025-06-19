import 'package:fin_tamer/features/transaction/domain/services/today_transaction_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/amount_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayTransactionsList extends ConsumerWidget {
  const TodayTransactionsList.income({super.key}) : isIncome = true;
  const TodayTransactionsList.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionService = ref.watch(todayTransactionServiceProvider(
      isIncome: isIncome,
    ));

    return Column(
      children: [
        AmountWidget(
            title: "Всего",
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
                              showTime: false,
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
