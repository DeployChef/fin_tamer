import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/today_transactions_list.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/dialogs/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OutcomePage extends StatelessWidget {
  const OutcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.outcomeTitle),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRoutes.outcomeHistory.name);
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: const TodayTransactionsList.outcome(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await TransactionDetails.showDetailsModal(context, isIncome: false);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
