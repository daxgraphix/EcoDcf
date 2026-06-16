import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/analytics/providers/analytics_providers.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ecodcf/core/services/pdf_report_service.dart';
import 'package:intl/intl.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AppBar(
          title: const Text('Insights'),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.share_outlined),
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
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
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
        message: 'Failed to load analytics.',
        onRetry: () => ref.invalidate(provider),
      );
    }

    final isLoading = asyncData.isLoading;
    final data = asyncData.value ?? _getPlaceholderData();

    if (data.isEmpty && !isLoading) {
      return const Center(child: Text('Start tracking to see insights!'));
    }

    final totalCarbon = data.fold(0.0, (sum, item) => sum + item.carbonValue);
    final categoryData = _getCategoryData(data);

    return Skeletonizer(
      enabled: isLoading,
      child: RefreshIndicator(
        onRefresh: () async => ref.invalidate(provider),
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            _buildSummaryCard(totalCarbon, data.length),
            const SizedBox(height: AppSpacing.lg),
            _buildChartCard(data),
            const SizedBox(height: AppSpacing.lg),
            _buildCategorySection(categoryData),
            const SizedBox(height: AppSpacing.lg),
            _buildHistorySection(data),
          ],
        ),
      ),
    );
  }

  Map<String, double> _getCategoryData(List<AnalyticsData> data) {
    final Map<String, double> categories = {};
    for (var item in data) {
      String category = item.category.replaceAll('_', ' ');
      // Normalize specific high-level categories
      if (category.toLowerCase().contains('ai')) category = 'Artificial Intelligence';
      if (category.toLowerCase().contains('ecommerce')) category = 'E-Commerce';
      if (category.toLowerCase().contains('crypto')) category = 'Cryptocurrency';
      if (category.toLowerCase().contains('device')) category = 'Hardware';
      if (category.toLowerCase().contains('streaming')) category = 'Entertainment';
      
      categories[category] = (categories[category] ?? 0) + item.carbonValue;
    }
    return categories;
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Artificial Intelligence': return Colors.purple;
      case 'E-Commerce': return Colors.orange;
      case 'Cryptocurrency': return Colors.amber;
      case 'Hardware': return Colors.blue;
      case 'Entertainment': return Colors.red;
      case 'Email': return Colors.lightBlue;
      default: return AppColors.forestGreen;
    }
  }

  Widget _buildSummaryCard(double total, int count) {
    return Card(
      elevation: 0,
      color: AppColors.forestGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Total Footprint',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '${total.toStringAsFixed(2)} kg CO₂e',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Across $count tracked activities',
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard(List<AnalyticsData> data) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Trend Analysis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: const Text('CO₂e kg', style: TextStyle(fontSize: 10, color: AppColors.forestGreen, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(height: 200, child: _buildChart(data)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(Map<String, double> categoryData) {
    final total = categoryData.values.fold(0.0, (a, b) => a + b);
    final sortedEntries = categoryData.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text('Impact Distribution', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: sortedEntries.map((entry) {
                final percentage = total > 0 ? entry.value / total : 0.0;
                final color = _getCategoryColor(entry.key);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                              ),
                              const SizedBox(width: 8),
                              Text(entry.key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.grey700)),
                            ],
                          ),
                          Text('${entry.value.toStringAsFixed(2)} kg (${(percentage * 100).toStringAsFixed(1)}%)', 
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: percentage,
                          backgroundColor: color.withValues(alpha: 0.1),
                          color: color,
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistorySection(List<AnalyticsData> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text('Recent History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        ...data.reversed.take(10).map((item) => Card(
          margin: const EdgeInsets.only(bottom: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
          color: Colors.white,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.offWhite,
              child: Icon(Icons.history, color: AppColors.forestGreen, size: 20),
            ),
            title: Text(DateFormat('MMM dd, yyyy').format(item.date), style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(item.category.replaceAll('_', ' ')),
            trailing: Text(
              '${item.carbonValue.toStringAsFixed(2)} kg',
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.forestGreen),
            ),
          ),
        )),
      ],
    );
  }

  List<AnalyticsData> _getPlaceholderData() {
    return List.generate(
      7,
      (index) => AnalyticsData(
        date: DateTime.now().subtract(Duration(days: index)),
        carbonValue: 0.5 + index * 0.2,
        category: 'Sample',
      ),
    );
  }

  Widget _buildChart(List<AnalyticsData> data) {
    if (data.isEmpty) return const SizedBox.shrink();

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= data.length || index % (data.length / 3).ceil() != 0) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateFormat('MM/dd').format(data[index].date),
                    style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                  ),
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
            spots: data.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.carbonValue)).toList(),
            isCurved: true,
            color: AppColors.forestGreen,
            barWidth: 3,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [AppColors.forestGreen.withValues(alpha: 0.2), AppColors.forestGreen.withValues(alpha: 0.0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
