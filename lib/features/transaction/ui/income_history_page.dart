import 'package:fin_tamer/features/transaction/ui/widgets/history_filter.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class IncomeHistoryPage extends StatelessWidget {
  const IncomeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toUtc();
    final startDate = DateTime(now.year, now.month, now.day).add(const Duration(days: -10));
    final endDate = DateTime(now.year, now.month, now.day).add(const Duration(days: 1)).add(const Duration(minutes: -1));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Моя история(i)"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.pending_actions),
          ),
        ],
      ),
      body: Column(
        children: [
          const HistoryFilter(),
          Expanded(
            child: TransactionsList(
              isIncome: true,
              isHistory: true,
              startDate: startDate,
              endDate: endDate,
            ),
          ),
        ],
      ),
    );
  }
}
