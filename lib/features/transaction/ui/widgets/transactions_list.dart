import 'package:fin_tamer/features/transaction/domain/services/transaction_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/amount_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key, required this.isIncome, this.isHistory = false, this.startDate, this.endDate});

  final bool isIncome;
  final bool isHistory;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionService = ref.watch(transactionServiceProvider(
      isIncome: isIncome,
      startDate: startDate,
      endDate: endDate,
    ));

    return Column(
      children: [
        AmountWidget(
            title: isHistory ? "Сумма" : "Всего",
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
                              showTime: isHistory,
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
