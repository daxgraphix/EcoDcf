import 'dart:async';
import 'package:ecodcf/features/carbon/presentation/pages/carbon_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/design_system/components/glass_card.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';
import 'package:ecodcf/features/dashboard/presentation/widgets/modern_score_gauge.dart';
import 'package:ecodcf/core/utils/carbon_calculator.dart';
import 'package:ecodcf/core/utils/impact_equivalency_converter.dart';
import 'package:ecodcf/features/carbon/providers/carbon_providers.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:ecodcf/features/carbon/presentation/widgets/quick_log_bottom_sheet.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';
import 'package:ecodcf/features/dashboard/presentation/widgets/activity_carbon_feed.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);

    return dashboardAsync.when(
      data: (stats) => _buildScaffold(context, ref, stats),
      loading: () => const _LoadingScaffold(),
      error: (err, stack) => Scaffold(
        body: ErrorView(
          message: err.toString(),
          onRetry: () => ref.read(dashboardProvider.notifier).refresh(),
        ),
      ),
    );
  }

Widget _buildScaffold(BuildContext context, WidgetRef ref, DashboardStats stats) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const QuickLogBottomSheet(),
          );
        },
        backgroundColor: AppColors.forestGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Quick Log', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8F5E9),
                  AppColors.offWhite,
                  Color(0xFFE3F2FD),
                ],
              ),
            ),
          ),
          SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(dashboardProvider.notifier).refresh();
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HeaderWidget(),
                    const SizedBox(height: AppSpacing.xl),
                    
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 3,
                          child: GlassCard(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.shield_outlined, size: 16, color: AppColors.forestGreen),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Digital Sustainability',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.md),
                                Expanded(
                                  child: ModernScoreGauge(score: stats.dscore, size: 220),
                                ),
                                const SizedBox(height: AppSpacing.md),
                                _ScoreLabel(score: stats.dscore),
                              ],
                            ),
                          ),
                        ),

                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: GlassCard(
                            opacity: 0.15,
                            child: _BentoStat(
                              label: 'Carbon Saved',
                              value: '${stats.totalSaved.toStringAsFixed(1)}kg',
                              icon: Icons.eco_outlined,
                              color: AppColors.leafGreen,
                            ),
                          ),
                        ),

                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: OpenContainer(
                            transitionType: ContainerTransitionType.fadeThrough,
                            openBuilder: (context, _) => const CarbonHistoryPage(),
                            closedElevation: 0,
                            closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
                            closedColor: Colors.transparent,
                            closedBuilder: (context, openContainer) => GlassCard(
                              onTap: openContainer,
                              opacity: 0.15,
                              child: _BentoStat(
                                label: 'Activity History',
                                value: '${stats.streakDays}d Streak',
                                icon: Icons.history_rounded,
                                color: AppColors.forestGreen,
                              ),
                            ),
                          ),
                        ),

                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2,
                          child: GlassCard(
                            opacity: 0.1,
                            child: _DeviceBreakdownWidget(breakdown: stats.deviceBreakdown),
                          ),
                        ),

                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: GlassCard(
                            gradient: LinearGradient(
                              colors: [AppColors.forestGreen.withValues(alpha: 0.8), AppColors.leafGreen.withValues(alpha: 0.8)],
                            ),
                            child: _BentoStat(
                              label: 'Global Trees',
                              value: stats.globalTreesSaved.toString(),
                              icon: Icons.park_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: GlassCard(
                            opacity: 0.2,
                            child: _BentoStat(
                              label: 'Steps Offset',
                              value: '${stats.todaySteps}',
                              icon: Icons.directions_walk_rounded,
                              color: AppColors.forestGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    _ImpactEquivalencyList(carbon: stats.todayCarbon),
                    const SizedBox(height: AppSpacing.xl),
                    const ActivityCarbonFeed(),
                    const SizedBox(height: AppSpacing.xl),
                    const _ManualFootprintSection(),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends ConsumerWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(userPreferencesProvider);

    return prefsAsync.when(
      data: (prefs) {
        final name = prefs.userName ?? 'Eco Warrior';
        final hour = DateTime.now().hour;
        String greeting = 'Good morning';
        if (hour >= 12 && hour < 17) greeting = 'Good afternoon';
        if (hour >= 17) greeting = 'Good evening';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$greeting, $name!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.forestGreen,
                          ),
                    ),
                    Text(
                      'Your digital footprint is lower than average today.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.grey600,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.forestGreen, AppColors.leafGreen],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 20),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => const ShimmerLoading(width: 200, height: 50),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppColors.forestGreen),
            const SizedBox(height: AppSpacing.md),
            Text('Syncing Eco Data...', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class _ScoreLabel extends StatelessWidget {
  final double score;
  const _ScoreLabel({required this.score});

  @override
  Widget build(BuildContext context) {
    String level = 'Excellent';
    Color color = AppColors.success;
    if (score < 25) { level = 'Needs Improvement'; color = AppColors.error; }
    else if (score < 50) { level = 'Average'; color = AppColors.warning; }
    else if (score < 75) { level = 'Good'; color = AppColors.leafGreen; }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        level,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}

class _BentoStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _BentoStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: color, size: 28),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.grey600)),
          ],
        ),
      ],
    );
  }
}

class _DeviceBreakdownWidget extends StatelessWidget {
  final Map<String, double> breakdown;
  const _DeviceBreakdownWidget({required this.breakdown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Usage Breakdown',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
              const Icon(Icons.pie_chart_outline, size: 16, color: AppColors.grey600),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: breakdown.entries.take(3).map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          children: [
                            Container(width: 8, height: 8, decoration: BoxDecoration(color: _getColorFor(e.key), shape: BoxShape.circle)),
                            const SizedBox(width: 8),
                            Expanded(child: Text(e.key, style: const TextStyle(fontSize: 10))),
                            Text('${(e.value * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  flex: 2,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final size = constraints.maxWidth < constraints.maxHeight ? constraints.maxWidth : constraints.maxHeight;
                    return Center(
                      child: SizedBox(
                        width: size,
                        height: size,
                        child: Stack(
                          children: [
                            CircularProgressIndicator(
                              value: breakdown.values.fold(0.0, (a, b) => a + b) / 1,
                              strokeWidth: 8,
                              backgroundColor: AppColors.grey200,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.forestGreen),
                            ),
                            Center(
                              child: Text(
                                '${breakdown.length}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorFor(String key) {
    switch (key.toLowerCase()) {
      case 'video': return AppColors.forestGreen;
      case 'social': return AppColors.leafGreen;
      case 'work': return AppColors.sageGreen;
      default: return AppColors.mintGreen;
    }
  }
}

// Interactive Manual Footprint Calculation
class _ManualFootprintSection extends ConsumerStatefulWidget {
  const _ManualFootprintSection();

  @override
  ConsumerState<_ManualFootprintSection> createState() => _ManualFootprintState();
}

class _ManualFootprintState extends ConsumerState<_ManualFootprintSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valueController = TextEditingController();
  String _selectedActivity = '';
  List<CarbonRecord> _recentRecords = [];
  double _previewCarbon = 0.0;

  static const List<String> _activityOptions = [
    'Email',
    'Search',
    'AI Search',
    'AI Image Gen',
    'Cloud Storage',
    'Social Media',
    'Gaming',
    'Music Streaming',
    'Video Streaming',
    'Video Call',
    'File Download',
    'Ecommerce Order',
    'Crypto Transaction',
  ];

  static const Map<String, String> _unitOptions = {
    'Email': 'emails',
    'Search': 'searches',
    'AI Search': 'prompts',
    'AI Image Gen': 'images',
    'Cloud Storage': 'GB',
    'Social Media': 'hours',
    'Gaming': 'hours',
    'Music Streaming': 'hours',
    'Video Streaming': 'hours',
    'Video Call': 'hours',
    'File Download': 'GB',
    'Ecommerce Order': 'orders',
    'Crypto Transaction': 'transactions',
  };

  @override
  void initState() {
    super.initState();
    _loadRecentRecords();
    _valueController.addListener(_updatePreview);
  }

  void _updatePreview() {
    final value = double.tryParse(_valueController.text);
    if (value != null && _selectedActivity.isNotEmpty) {
      setState(() {
        _previewCarbon = _calculateRecord(_selectedActivity, value).carbonValue;
      });
    } else {
      setState(() {
        _previewCarbon = 0.0;
      });
    }
  }

  Future<void> _loadRecentRecords() async {
    final repo = await ref.read(carbonRepositoryProvider.future);
    final records = await repo.getAllRecords();
    if (mounted) {
      setState(() {
        _recentRecords = records.take(5).toList();
      });
    }
  }

  @override
  void dispose() {
    _valueController.removeListener(_updatePreview);
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EcoCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Manual Footprint Calculation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _selectedActivity.isNotEmpty ? _selectedActivity : null,
                items: _activityOptions
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedActivity = value ?? '';
                    _updatePreview();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Activity',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _valueController,
                          decoration: InputDecoration(
                            labelText: 'Value (${_unitOptions[_selectedActivity] ?? ''})',
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        if (_previewCarbon > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Estimated: ${_previewCarbon.toStringAsFixed(3)} kg CO2e',
                              style: const TextStyle(
                                color: AppColors.forestGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && _selectedActivity.isNotEmpty) {
                        unawaited(HapticFeedback.lightImpact());
                        final value = double.tryParse(_valueController.text) ?? 0;
                        final record = _calculateRecord(_selectedActivity, value);

                        final repo = await ref.read(carbonRepositoryProvider.future);
                        await repo.saveRecord(record);

                        ref.invalidate(carbonRecordsStreamProvider);
                        if (mounted) {
                          await ref.read(dashboardProvider.notifier).refresh();
                        }

                        setState(() {
                          _recentRecords.insert(0, record);
                          if (_recentRecords.length > 5) _recentRecords.removeLast();
                          _valueController.clear();
                          _previewCarbon = 0.0;
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              if (_recentRecords.isNotEmpty) ...[
                const Text('Recent Calculations:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: AppSpacing.sm),
                ..._recentRecords.map((r) => _CarbonRecordTile(record: r)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  CarbonRecord _calculateRecord(String activity, double value) {
    switch (activity) {
      case 'Email':
        return CarbonCalculator.calculateEmail(count: value.toInt(), hasAttachment: false);
      case 'Search':
        return CarbonCalculator.calculateSearch(searchCount: value.toInt(), isAI: false);
      case 'AI Search':
        return CarbonCalculator.calculateSearch(searchCount: value.toInt(), isAI: true);
      case 'AI Image Gen':
        return CarbonCalculator.calculateAIUsage(promptCount: value.toInt(), isImageGeneration: true);
      case 'Cloud Storage':
        return CarbonCalculator.calculateCloudStorage(gbStored: value, gbTransferred: value * 2);
      case 'Social Media':
        return CarbonCalculator.calculateSocialMedia(hours: value, posts: 0);
      case 'Gaming':
        return CarbonCalculator.calculateGaming(hours: value, platform: 'console');
      case 'Music Streaming':
        return CarbonCalculator.calculateMusicStreaming(hours: value);
      case 'Video Streaming':
        return CarbonCalculator.calculateStreaming(hours: value, quality: 'HD');
      case 'Video Call':
        return CarbonCalculator.calculateVideoCall(hours: value, quality: 'HD');
      case 'File Download':
        return CarbonCalculator.calculateFileDownload(gb: value);
      case 'Ecommerce Order':
        return CarbonCalculator.calculateEcommerce(orderCount: value.toInt());
      case 'Crypto Transaction':
        return CarbonCalculator.calculateCrypto(transactionCount: value, currency: 'BTC');
      default:
        return CarbonCalculator.calculateDeviceEnergy(watts: value, hours: 1);
    }
  }
}

class _CarbonRecordTile extends StatelessWidget {
  final CarbonRecord record;
  const _CarbonRecordTile({required this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.co2, color: AppColors.forestGreen, size: 20),
        ),
        title: Text(record.type.replaceAll('_', ' ').toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${record.carbonValue.toStringAsFixed(3)} kg CO₂e',
                style: const TextStyle(color: AppColors.forestGreen)),
            Text(record.createdAt.toString().split('.')[0],
                style: const TextStyle(fontSize: 10, color: AppColors.grey600)),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, size: 20),
      ),
    );
  }
}

class _ImpactEquivalencyList extends StatelessWidget {
  final double carbon;
  const _ImpactEquivalencyList({required this.carbon});

  @override
  Widget build(BuildContext context) {
    final equivalencies = ImpactEquivalency.getEquivalencies(carbon);

    if (equivalencies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          child: Text(
            'Your impact is equivalent to:',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.grey600,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: equivalencies.length,
            itemBuilder: (context, index) {
              final item = equivalencies[index];
              return _EquivalencyCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}

class _EquivalencyCard extends StatelessWidget {
  final ImpactEquivalency item;
  const _EquivalencyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: item.color.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: item.color, size: 24),
          const SizedBox(height: AppSpacing.xs),
          Text(
            item.value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
          ),
          Text(
            item.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.grey600,
                ),
          ),
        ],
      ),
    );
  }
}