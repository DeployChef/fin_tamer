import 'package:fin_tamer/features/transaction/ui/widgets/history_filter.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/history_transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OutcomeHistoryPage extends StatelessWidget {
  const OutcomeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Моя история"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.pending_actions),
            ),
          ],
        ),
        body: const Column(
          children: [
            HistoryFilter.outcome(),
            Expanded(child: HistoryTransactionsList.outcome()),
          ],
        ),
      ),
    );
  }
}
