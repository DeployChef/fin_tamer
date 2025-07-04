import 'package:chart_widget/chart_widget.dart';
import 'package:fin_tamer/core/extensions/color_from_string_extension.dart';
import 'package:fin_tamer/features/transaction/domain/services/analytics/analytics_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsChart extends ConsumerStatefulWidget {
  const AnalyticsChart({
    super.key,
    required this.isIncome,
  });

  final bool isIncome;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnalyticsChartState();
}

class _AnalyticsChartState extends ConsumerState<AnalyticsChart> {
  List<PieChartSection> _lastChartData = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final analyticsService = ref.watch(analyticsServiceProvider(
      isIncome: widget.isIncome,
    ));

    List<PieChartSection> chartData = [];

    analyticsService.when(
      data: (list) {
        chartData = list
            .map((e) => PieChartSection(
                  title: e.category.name,
                  value: e.percentage,
                  color: e.category.name.colorFromString,
                ))
            .toList();
        _lastChartData = chartData;
      },
      loading: () {
        chartData = _lastChartData;
      },
      error: (e, st) {},
    );

    return chartData.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              SizedBox(
                height: 185,
                child: AnimatedPieChartWidget(
                  data: chartData,
                  titleStyle: theme.textTheme.labelSmall!,
                ),
              ),
              const Divider(),
            ],
          );
  }
}
