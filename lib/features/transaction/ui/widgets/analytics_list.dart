import 'package:fin_tamer/core/extensions/color_from_string_extension.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/currency/ui/money_widget.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_service.dart';
import 'package:fin_tamer/features/transaction/ui/widgets/analytic_item.dart';
import 'package:fl_chart/fl_chart.dart';
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
    final theme = Theme.of(context);

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
          child: analyticsService.when(
            data: (analyticsList) {
              final chartData = analyticsList
                  .map((e) => PieChartSection(
                        title: e.category.name,
                        value: e.percentage,
                        color: e.category.name.colorFromString,
                      ))
                  .toList();
              return PieChartWidget(
                data: chartData,
                titleStyle: theme.textTheme.labelSmall!,
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Ошибка: $e'),
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

class PieChartSection {
  final String title;
  final double value;
  final Color color;

  PieChartSection({required this.title, required this.value, required this.color});
}

class PieChartWidget extends StatelessWidget {
  final List<PieChartSection> data;
  final TextStyle titleStyle;
  final int maxTitles;

  const PieChartWidget({super.key, required this.data, required this.titleStyle, this.maxTitles = 3});

  @override
  Widget build(BuildContext context) {
    var titleCount = 0;

    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            startDegreeOffset: -90,
            sections: data
                .map(
                  (e) => PieChartSectionData(
                    value: e.value,
                    color: e.color,
                    title: '',
                    titleStyle: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
                    radius: 10,
                  ),
                )
                .toList(),
            sectionsSpace: 0,
            centerSpaceRadius: 65,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.map((e) {
            if (titleCount > maxTitles) {
              return SizedBox.shrink();
            }

            if (titleCount == maxTitles) {
              return Text(
                "...",
                style: titleStyle,
              );
            }

            titleCount++;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: e.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${e.value.toStringAsFixed(0)}% ${e.title}',
                    style: titleStyle,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
