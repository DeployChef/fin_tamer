import 'package:fin_tamer/features/transaction/ui/widgets/transactions_history_list.dart';
import 'package:flutter/material.dart';

class OutcomeHistoryPage extends StatelessWidget {
  const OutcomeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Моя история"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.pending_actions),
          ),
        ],
      ),
      body: TransactionsHistoryList.outcome(),
    );
  }
}
