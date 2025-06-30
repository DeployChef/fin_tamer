import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytic_item.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytics_chart.dart';
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

    bool isLoading = false;
    String? error;
    List analyticsList = [];

    analyticsService.when(
      data: (list) {
        analyticsList = list;
      },
      loading: () {
        isLoading = true;
      },
      error: (e, st) {
        error = e.toString();
      },
    );

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
          title: Text(loc.amountHistoryTitle),
          trailing: MoneyWidget(amount: analyticsList.isNotEmpty ? analyticsList.map((c) => c.amount).reduce((a, b) => a + b) : 0.0),
        ),
        const Divider(),
        AnalyticsChart(
          isIncome: isIncome,
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : error != null
                  ? Center(child: Text("Error [$error]"))
                  : (analyticsList.isEmpty
                      ? Center(child: Text(loc.notFound))
                      : ListView.builder(
                          itemCount: analyticsList.length,
                          itemBuilder: (context, index) {
                            final item = analyticsList[index];
                            return Column(
                              children: [
                                AnalyticItem(item: item),
                                const Divider(
                                  height: 1,
                                ),
                              ],
                            );
                          },
                        )),
        ),
      ],
    );
  }
}
