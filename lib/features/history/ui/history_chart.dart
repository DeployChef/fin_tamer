import 'package:chart_widget/chart_widget.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/history/domain/services/history_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fin_tamer/features/history/domain/models/account_history.dart';

enum HistoryChartMode { byDay, byMonth }

class _ChartData {
  final List<BalanceBarData> bars;
  final BalanceChartConfig config;
  _ChartData(this.bars, this.config);
}

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
    if (account == null) return const SizedBox.shrink();
    final historyFeed = ref.watch(historyServiceProvider(account.id)).value;
    if (historyFeed == null) return const SizedBox.shrink();

    final _ChartData chartData = _mode == HistoryChartMode.byDay ? _chartCurrentMonthData(historyFeed) : _chartByMonthsData(historyFeed);

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
          ),
        ),
        BalanceBarChartWidget(
          bars: chartData.bars,
          config: chartData.config,
        ),
      ],
    );
  }

  _ChartData _chartCurrentMonthData(historyFeed) {
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
      if (DateTime.now().day < day) {
        bars.add(BalanceBarData(
          x: day,
          value: 0,
          color: const Color(0xFF2AE881),
          label: null,
        ));
        continue;
      }
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
    return _ChartData(bars, config);
  }

  _ChartData _chartByMonthsData(historyFeed) {
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
    return _ChartData(bars, config);
  }
}
