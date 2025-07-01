import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/history/domain/services/history_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class HistoryChart extends ConsumerWidget {
  const HistoryChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountServiceProvider).value;
    if (account == null) return const SizedBox();
    final historyFeed = ref.watch(historyServiceProvider(account.id)).value;
    if (historyFeed == null) return const SizedBox();

    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final sortedHistory = [...historyFeed.history]..sort((a, b) => a.changeTimestamp.compareTo(b.changeTimestamp));

    final Map<int, double> dayBalances = {};
    double startBalance = sortedHistory.isNotEmpty ? sortedHistory.first.previousState.balance : 0.0;

    for (final h in sortedHistory) {
      final date = h.changeTimestamp;
      final day = date.day;

      if (date.month == now.month && date.year == now.year) {
        dayBalances[day] = h.newState.balance;
      }
    }

    // 2. Заполняем каждый день месяца, если нет изменений — берем предыдущий баланс
    double prevBalance = startBalance;
    final bars = <BalanceBarData>[];
    for (int day = 1; day <= daysInMonth; day++) {
      final balance = dayBalances.containsKey(day) ? dayBalances[day]! : prevBalance;
      bars.add(BalanceBarData(
        x: day,
        value: balance,
        color: balance >= 0 ? const Color(0xFF2AE881) : const Color(0xFFFF5F00),
        label: null,
      ));
      prevBalance = balance;
    }
    final labelX = [1, (daysInMonth / 2).round(), daysInMonth];
    final config = BalanceChartConfig(
      minY: 0,
      maxY: bars.isNotEmpty ? bars.map((b) => b.value.abs()).reduce(max) * 1.2 : 10,
      barsCount: daysInMonth,
      labelX: labelX,
      xLabelFormatter: (x) {
        final date = DateTime(now.year, now.month, x);
        return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}';
      },
    );
    return BalanceBarChart(bars: bars, config: config);
  }
}

// --- Модель данных для чистого чарта ---
// --- Модель данных для чистого чарта ---
// --- Модель данных для чистого чарта ---
// --- Модель данных для чистого чарта ---
// --- Модель данных для чистого чарта ---
class BalanceBarData {
  final int x;
  final double value;
  final Color color;
  final String? label;
  BalanceBarData({required this.x, required this.value, required this.color, this.label});
}

class BalanceChartConfig {
  final double minY;
  final double maxY;
  final int barsCount;
  final List<int> labelX;
  final String Function(int x)? xLabelFormatter;
  BalanceChartConfig({
    required this.minY,
    required this.maxY,
    required this.barsCount,
    required this.labelX,
    this.xLabelFormatter,
  });
}

// --- Чистый чарт ---
class BalanceBarChart extends StatelessWidget {
  final List<BalanceBarData> bars;
  final BalanceChartConfig config;
  const BalanceBarChart({super.key, required this.bars, required this.config});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 220,
        child: BarChart(
          BarChartData(
            barGroups: bars
                .map((bar) => BarChartGroupData(
                      x: bar.x,
                      barRods: [
                        BarChartRodData(
                          toY: bar.value.abs(),
                          color: bar.color,
                          width: 6,
                          borderRadius: BorderRadius.all(Radius.circular(92)),
                        ),
                      ],
                    ))
                .toList(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final x = value.toInt();
                    if (config.labelX.contains(x)) {
                      final label = config.xLabelFormatter?.call(x) ?? x.toString();
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(label, style: const TextStyle(fontSize: 10)),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  reservedSize: 24,
                ),
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: BarTouchData(enabled: true),
            maxY: config.maxY,
            minY: config.minY,
          ),
        ),
      ),
    );
  }
}
