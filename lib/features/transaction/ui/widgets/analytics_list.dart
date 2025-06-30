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

    double amount = 0.0;
    List<PieChartSection> chartData = [];
    bool isLoading = false;
    String? error;
    List analyticsList = [];

    analyticsService.when(
      data: (list) {
        analyticsList = list;
        amount = list.isNotEmpty ? list.map((c) => c.amount).reduce((a, b) => a + b) : 0.0;
        chartData = list
            .map((e) => PieChartSection(
                  title: e.category.name,
                  value: e.percentage,
                  color: e.category.name.colorFromString,
                ))
            .toList();
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
          trailing: MoneyWidget(amount: amount),
        ),
        const Divider(),
        Ch(
          isIncome: isIncome,
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : error != null
                  ? const Center(child: Text("Error"))
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

class Ch extends ConsumerStatefulWidget {
  const Ch({
    super.key,
    required this.isIncome,
  });

  final bool isIncome;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChState();
}

class _ChState extends ConsumerState<Ch> {
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
                child: PieChartWidget(
                  data: chartData,
                  titleStyle: theme.textTheme.labelSmall!,
                ),
              ),
              const Divider(),
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

class PieChartWidget extends StatefulWidget {
  final List<PieChartSection> data;
  final TextStyle titleStyle;
  final int maxTitles;

  const PieChartWidget({super.key, required this.data, required this.titleStyle, this.maxTitles = 3});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> with SingleTickerProviderStateMixin {
  late List<PieChartSection> _oldData;
  late List<PieChartSection> _newData;
  late AnimationController _controller;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _oldData = [];
    _newData = widget.data;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _isAnimating = true;
    _controller.reset();
    _controller.forward().then((_) {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  void didUpdateWidget(covariant PieChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      _oldData = oldWidget.data;
      _newData = widget.data;
      _isAnimating = true;
      _controller.reset();
      _controller.forward().then((_) {
        setState(() {
          _isAnimating = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAnimating && _newData == _oldData) {
      // Нет анимации, просто отрисовываем
      return _buildChart(_newData, 0, 1.0);
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle = _controller.value * 360;
        final isFirstHalf = _controller.value < 0.5;
        final opacity = isFirstHalf
            ? 1.0 - _controller.value * 2 // 1 -> 0
            : (_controller.value - 0.5) * 2; // 0 -> 1
        final data = isFirstHalf ? _oldData : _newData;
        return _buildChart(data, angle, opacity);
      },
    );
  }

  Widget _buildChart(List<PieChartSection> data, double angle, double opacity) {
    var titleCount = 0;
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle * 3.1415926 / 180,
        child: Stack(
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
                if (titleCount > widget.maxTitles) {
                  return const SizedBox.shrink();
                }
                if (titleCount == widget.maxTitles) {
                  return Text(
                    "...",
                    style: widget.titleStyle,
                  );
                }
                titleCount++;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
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
                        style: widget.titleStyle,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
