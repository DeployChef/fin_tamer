import 'package:chart_widget/chart_widget.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/history/domain/services/transaction_chart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';

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
  TransactionChartMode _mode = TransactionChartMode.byDay;
  List<Transaction> _lastTransactions = [];

  @override
  Widget build(BuildContext context) {
    final accountAsync = ref.watch(accountServiceProvider);
    final loc = AppLocalizations.of(context)!;
    return accountAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, st) => const SizedBox.shrink(),
      data: (account) {
        if (account == null) return const SizedBox.shrink();
        final transactionsAsync = ref.watch(transactionChartServiceProvider);

        var transactions = _lastTransactions;

        if (!transactionsAsync.isLoading && !transactionsAsync.hasError) {
          transactions = transactionsAsync.value ?? [];
          _lastTransactions = transactions;
        }

        final chartData = _mode == TransactionChartMode.byDay ? _chartCurrentMonthData(transactions) : _chartByMonthsData(transactions);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SegmentedButton<TransactionChartMode>(
                segments: [
                  ButtonSegment(
                    value: TransactionChartMode.byDay,
                    label: SizedBox(width: 150, child: Center(child: Text(loc.byDay))),
                  ),
                  ButtonSegment(
                    value: TransactionChartMode.byMonth,
                    label: SizedBox(width: 150, child: Center(child: Text(loc.byMonth))),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: (modes) {
                  if (modes.isNotEmpty) {
                    ref.read(transactionChartServiceProvider.notifier).setMode(modes.first);
                    setState(() => _mode = modes.first);
                  }
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
      },
    );
  }

  _ChartData _chartCurrentMonthData(List<Transaction> transactions) {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final Map<int, double> daySums = {};
    for (final t in transactions) {
      if (t.transactionDate.month == now.month && t.transactionDate.year == now.year) {
        final signedAmount = t.category.isIncome ? t.amount : -t.amount;
        daySums[t.transactionDate.day] = (daySums[t.transactionDate.day] ?? 0) + signedAmount;
      }
    }
    final bars = <BalanceBarData>[];
    for (int day = 1; day <= daysInMonth; day++) {
      final value = daySums[day] ?? 0;
      bars.add(BalanceBarData(
        x: day,
        value: value,
        color: value >= 0 ? const Color(0xFF2AE881) : const Color(0xFFFF5F00),
        label: null,
      ));
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

  _ChartData _chartByMonthsData(List<Transaction> transactions) {
    final now = DateTime.now();
    final Map<int, double> monthSums = {};
    for (final t in transactions) {
      if (t.transactionDate.year == now.year) {
        final signedAmount = t.category.isIncome ? t.amount : -t.amount;
        monthSums[t.transactionDate.month] = (monthSums[t.transactionDate.month] ?? 0) + signedAmount;
      }
    }
    final bars = <BalanceBarData>[];
    for (int month = 1; month <= now.month; month++) {
      final value = monthSums[month] ?? 0;
      bars.add(BalanceBarData(
        x: month,
        value: value,
        color: value >= 0 ? const Color(0xFF2AE881) : const Color(0xFFFF5F00),
        label: '${month.toString().padLeft(2, '0')}.${now.year}',
      ));
    }
    final config = BalanceChartConfig(
      minY: 0,
      maxY: bars.isNotEmpty ? bars.map((b) => b.value.abs()).reduce(max) * 1.2 : 10,
      barsCount: now.month,
      labelX: List.generate(now.month, (i) => i + 1),
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
