import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytic_item.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsList extends ConsumerWidget {
  const AnalyticsList.income({super.key}) : isIncome = true;
  const AnalyticsList.outcome({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsService = ref.watch(analyticsServiceProvider(
      isIncome: isIncome,
    ));

    final loc = AppLocalizations.of(context)!;

    final amount = analyticsService.when(
      data: (transactions) => transactions.isNotEmpty ? transactions.map((c) => c.amount).reduce((a, b) => a + b) : 0.0,
      error: (_, __) => 0.0,
      loading: () => 0.0,
    );

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          title: Text(loc.amountHistoryTitle),
          trailing: MoneyWidget(amount: amount),
        ),
        const Divider(),
        SizedBox(
          height: 185,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(color: Colors.yellow, width: 5),
              ),
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: analyticsService.when(
            data: (transactions) {
              return transactions.isEmpty
                  ? Center(child: Text(loc.notFound))
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final item = transactions[index];
                        return Column(
                          children: [
                            AnalyticItem(item: item),
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
