import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartSection {
  final String title;
  final double value;
  final Color color;

  PieChartSection({required this.title, required this.value, required this.color});
}

class PieChartWidget extends StatelessWidget {
  final List<PieChartSection> data;

  const PieChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        startDegreeOffset: -90, // Начало с верхней точки
        sections: data
            .map(
              (e) => PieChartSectionData(
                value: e.value,
                color: e.color,
                title: '${e.value.toStringAsFixed(2)}%',
                titleStyle: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
            )
            .toList(),
        sectionsSpace: 2,
        centerSpaceRadius: 6,
      ),
    );
  }
}
