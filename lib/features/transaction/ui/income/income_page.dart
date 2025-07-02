import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/today_transactions_list.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/dialogs/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IncomePage extends ConsumerWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.incomeTitle),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRoutes.incomeHistory.name);
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: const TodayTransactionsList.income(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await TransactionDetails.showDetailsModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
