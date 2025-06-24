import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/history_filter.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/history_transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OutcomeHistoryPage extends StatelessWidget {
  const OutcomeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.historyTitle),
          actions: [
            IconButton(
              onPressed: () {
                context.goNamed(AppRoutes.outcomeAnalytics.name);
              },
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
