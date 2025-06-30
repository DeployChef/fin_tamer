import 'package:chart_widget/chart_widget.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytics_filter.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeAnalyticsPage extends StatelessWidget {
  const IncomeAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(loc.analytics),
        ),
        body: const Column(
          children: [
            AnalyticsFilter.income(),
            Expanded(child: AnalyticsList.income()),
            PieChartWidget(text: "chart"),
          ],
        ),
      ),
    );
  }
}
