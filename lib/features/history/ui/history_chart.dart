import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/history/domain/services/history_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryChart extends ConsumerWidget {
  const HistoryChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountServiceProvider).value;
    if (account == null) return const SizedBox();
    final history = ref.watch(historyServiceProvider(account.id)).value;
    if (history == null) return const SizedBox();

    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final Map<int, double> daySums = {for (var i = 1; i <= daysInMonth; i++) i: 0};
    for (final stat in history.incomeStats) {
      final date = DateTime.tryParse(stat.name);
      if (date != null && date.month == now.month && date.year == now.year) {
        final day = date.day;
        daySums[day] = (daySums[day] ?? 0) + (double.tryParse(stat.value) ?? 0);
      }
    }
    for (final stat in history.expenseStats) {
      final date = DateTime.tryParse(stat.name);
      if (date != null && date.month == now.month && date.year == now.year) {
        final day = date.day;
        daySums[day] = (daySums[day] ?? 0) + (double.tryParse(stat.value) ?? 0);
      }
    }
    final barGroups = daySums.entries.map((entry) {
      final day = entry.key;
      final value = entry.value;
      return BarChartGroupData(
        x: day,
        barRods: [
          BarChartRodData(
            toY: value.abs(),
            color: value >= 0 ? const Color(0xFF2AE881) : const Color(0xFFFF5F00),
            width: 10,
            borderRadius: BorderRadius.all(Radius.circular(92)),
          ),
        ],
      );
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 220,
        child: BarChart(
          BarChartData(
            barGroups: barGroups,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final day = value.toInt();
                    if (day == 1 || day == (daysInMonth / 2).round() || day == daysInMonth) {
                      final date = DateTime(now.year, now.month, day);
                      final label = '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}';
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
            maxY: daySums.values.isNotEmpty ? daySums.values.map((v) => v.abs()).reduce(max) * 1.2 : 10,
            minY: 0,
          ),
        ),
      ),
    );
  }
}
