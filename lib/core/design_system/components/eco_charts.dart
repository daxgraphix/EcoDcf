import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EcoBarChart extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final double? maxY;
  final String Function(double)? getBarValue;
  final String Function(int)? getLabel;
  
  const EcoBarChart({
    super.key,
    required this.barGroups,
    this.maxY,
    this.getBarValue,
    this.getLabel,
  });
  
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    getLabel?.call(value.toInt()) ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  getBarValue?.call(value) ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        maxY: maxY,
      ),
    );
  }
}

class EcoLineChart extends StatelessWidget {
  final List<LineChartBarData> lineBars;
  final List<FlSpot> spots;
  final double? minX;
  final double? maxX;
  final double? minY;
  final double? maxY;
  
  const EcoLineChart({
    super.key,
    required this.lineBars,
    required this.spots,
    this.minX,
    this.maxX,
    this.minY,
    this.maxY,
  });
  
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        lineBarsData: lineBars,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
      ),
    );
  }
}

class EcoPieChart extends StatelessWidget {
  final List<PieChartSectionData> sections;
  final double radius;
  
  const EcoPieChart({
    super.key,
    required this.sections,
    this.radius = 100,
  });
  
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 40,
      ),
    );
  }
}