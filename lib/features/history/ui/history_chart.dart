import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/history/domain/services/history_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fin_tamer/features/history/domain/models/account_history.dart';

enum HistoryChartMode { byDay, byMonth }

class HistoryChart extends ConsumerStatefulWidget {
  const HistoryChart({super.key});

  @override
  ConsumerState<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends ConsumerState<HistoryChart> {
  HistoryChartMode _mode = HistoryChartMode.byDay;

  @override
  Widget build(BuildContext context) {
    final account = ref.watch(accountServiceProvider).value;
    if (account == null) return const SizedBox();
    final historyFeed = ref.watch(historyServiceProvider(account.id)).value;
    if (historyFeed == null) return const SizedBox();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SegmentedButton<HistoryChartMode>(
            segments: const [
              ButtonSegment(
                value: HistoryChartMode.byDay,
                label: SizedBox(width: 150, child: Center(child: Text('По дням'))),
              ),
              ButtonSegment(
                value: HistoryChartMode.byMonth,
                label: SizedBox(width: 150, child: Center(child: Text('По месяцам'))),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (modes) {
              if (modes.isNotEmpty) setState(() => _mode = modes.first);
            },
            showSelectedIcon: false,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return const Color(0xff2AE881);
                }
                return const Color(0xffD4FAE6);
              }),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              overlayColor: WidgetStateProperty.all<Color>(const Color(0x332AE881)),
              elevation: WidgetStateProperty.all<double>(0),
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: Color(0xff2AE881), width: 2),
              ),
              visualDensity: VisualDensity.compact,
              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          child: _mode == HistoryChartMode.byDay ? _chartCurrentMonth(historyFeed) : _chartByMonths(historyFeed),
        ),
      ],
    );
  }

  Widget _chartCurrentMonth(historyFeed) {
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

    double prevBalance = startBalance;
    final bars = <BalanceBarData>[];
    for (int day = 1; day <= daysInMonth; day++) {
      // if (DateTime.now().day < day) {
      //   bars.add(BalanceBarData(x: day, value: 0, color: Colors.grey, label: null));
      //   continue;
      // }

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

  Widget _chartByMonths(historyFeed) {
    final sortedHistory = [...historyFeed.history]..sort((a, b) => a.changeTimestamp.compareTo(b.changeTimestamp));
    final Map<String, AccountHistory> lastOfMonth = {};
    for (final h in sortedHistory) {
      final key = '${h.changeTimestamp.year}-${h.changeTimestamp.month.toString().padLeft(2, '0')}';
      if (!lastOfMonth.containsKey(key) || h.changeTimestamp.isAfter(lastOfMonth[key]!.changeTimestamp)) {
        lastOfMonth[key] = h;
      }
    }

    final monthKeys = lastOfMonth.keys.toList()..sort((a, b) => a.compareTo(b));
    final bars = <BalanceBarData>[];
    int x = 1;
    for (final key in monthKeys) {
      final h = lastOfMonth[key]!;
      final balance = h.newState.balance;
      bars.add(BalanceBarData(
        x: x,
        value: balance,
        color: balance >= 0 ? const Color(0xFF2AE881) : const Color(0xFFFF5F00),
        label: '${h.changeTimestamp.month.toString().padLeft(2, '0')}.${h.changeTimestamp.year}',
      ));
      x++;
    }
    final config = BalanceChartConfig(
      minY: 0,
      maxY: bars.isNotEmpty ? bars.map((b) => b.value.abs()).reduce(max) * 1.2 : 10,
      barsCount: bars.length,
      labelX: List.generate(bars.length, (i) => i + 1),
      xLabelFormatter: (x) {
        final idx = x - 1;
        if (idx >= 0 && idx < bars.length) {
          return bars[idx].label ?? '';
        }
        return '';
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
                          borderRadius: const BorderRadius.all(Radius.circular(92)),
                        ),
                      ],
                    ))
                .toList(),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: const BarTouchData(enabled: true),
            maxY: config.maxY,
            minY: config.minY,
          ),
        ),
      ),
    );
  }
}
