import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/analytics/providers/analytics_providers.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ecodcf/core/services/pdf_report_service.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Analytics'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                onPressed: () async {
                  final index = DefaultTabController.of(context).index;
                  final provider = [
                    dailyAnalyticsProvider,
                    weeklyAnalyticsProvider,
                    monthlyAnalyticsProvider,
                    yearlyAnalyticsProvider
                  ][index];

                  final data = ref.read(provider).valueOrNull;
                  if (data != null && data.isNotEmpty) {
                    final titles = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
                    await PdfReportService.generateAndPrintReport(data, titles[index]);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No data available to export')),
                    );
                  }
                },
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
              Tab(text: 'Yearly'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _AnalyticsView(provider: dailyAnalyticsProvider),
            _AnalyticsView(provider: weeklyAnalyticsProvider),
            _AnalyticsView(provider: monthlyAnalyticsProvider),
            _AnalyticsView(provider: yearlyAnalyticsProvider),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsView extends ConsumerWidget {
  final AutoDisposeFutureProvider<List<AnalyticsData>> provider;

  const _AnalyticsView({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(provider);

    if (asyncData.hasError && !asyncData.isLoading) {
      return ErrorView(
        message: 'Failed to load analytics. Please try again.',
        onRetry: () => ref.invalidate(provider),
      );
    }

    final isLoading = asyncData.isLoading;
    final data = asyncData.value ?? _getPlaceholderData();

    if (data.isEmpty && !isLoading) {
      return const Center(child: Text('No data recorded yet.'));
    }

    final totalCarbon = data.fold(0.0, (sum, item) => sum + item.carbonValue);
    final categoryData = _getCategoryData(data);

    return Skeletonizer(
      enabled: isLoading,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSummaryCard(totalCarbon, data.length),
          const SizedBox(height: 24),
          _buildChart(data),
          const SizedBox(height: 24),
          const Text(
            'Category Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildCategoryBreakdown(categoryData),
          const SizedBox(height: 24),
          const Text(
            'History',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...data.reversed.map((item) => _buildHistoryItem(item)),
        ],
      ),
    );
  }

  Map<String, double> _getCategoryData(List<AnalyticsData> data) {
    final Map<String, double> categories = {};
    for (var item in data) {
      categories[item.category] = (categories[item.category] ?? 0) + item.carbonValue;
    }
    return categories;
  }

  Widget _buildCategoryBreakdown(Map<String, double> categoryData) {
    return Column(
      children: categoryData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(entry.key, style: const TextStyle(fontSize: 14)),
              ),
              Expanded(
                flex: 7,
                child: LinearProgressIndicator(
                  value: entry.value / categoryData.values.fold(0.0, (a, b) => a + b),
                  backgroundColor: Colors.grey[200],
                  color: AppColors.forestGreen,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${entry.value.toStringAsFixed(1)} kg',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  List<AnalyticsData> _getPlaceholderData() {
    return List.generate(
      5,
      (index) => AnalyticsData(
        date: DateTime.now().subtract(Duration(days: index)),
        carbonValue: 1.5,
        category: 'Placeholder',
      ),
    );
  }

  Widget _buildSummaryCard(double total, int count) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Total Footprint', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              '${total.toStringAsFixed(2)} kg CO2e',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.forestGreen,
              ),
            ),
            const SizedBox(height: 4),
            Text('Aggregated over $count periods', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(List<AnalyticsData> data) {
    // Performance: Downsample data if there are too many points for smooth rendering
    final List<AnalyticsData> displayData;
    if (data.length > 50) {
      final step = (data.length / 50).ceil();
      displayData = [];
      for (var i = 0; i < data.length; i += step) {
        displayData.add(data[i]);
      }
    } else {
      displayData = data;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsiveness: Adjust height and styling based on available width
        final isNarrow = constraints.maxWidth < 400;
        final chartHeight = isNarrow ? 180.0 : 220.0;

        return SizedBox(
          height: chartHeight,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: !isNarrow,
                    reservedSize: 22,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() % (displayData.length / 5).ceil() != 0) {
                        return const SizedBox.shrink();
                      }
                      final index = value.toInt();
                      if (index < 0 || index >= displayData.length) return const SizedBox.shrink();
                      return Text(
                        '${displayData[index].date.month}/${displayData[index].date.day}',
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: displayData.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value.carbonValue);
                  }).toList(),
                  isCurved: true,
                  color: AppColors.forestGreen,
                  barWidth: isNarrow ? 3 : 4,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHistoryItem(AnalyticsData item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text('${item.date.year}-${item.date.month}-${item.date.day}'),
        subtitle: Text(item.category),
        trailing: Text(
          '${item.carbonValue.toStringAsFixed(2)} kg CO2e',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.forestGreen,
          ),
        ),
      ),
    );
  }
}

