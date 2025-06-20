import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/transaction/domain/services/filtered_transaction_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/amount_widget.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryTransactionsList extends ConsumerWidget {
  const HistoryTransactionsList.income({super.key}) : isIncome = true;
  const HistoryTransactionsList.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionService = ref.watch(filteredTransactionServiceProvider(
      isIncome: isIncome,
    ));

    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        AmountWidget(
            title: loc.amountHistoryTitle,
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
                  ? Center(child: Text(loc.notFound))
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
