import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/presentation/widgets/error_view.dart';
import 'package:ecodcf/core/presentation/widgets/shimmer_loading.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';
import 'package:ecodcf/core/utils/carbon_calculator.dart';
import 'package:ecodcf/core/utils/impact_equivalency_converter.dart';
import 'package:ecodcf/features/carbon/providers/carbon_providers.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:flutter/services.dart';

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
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(dashboardProvider.notifier).refresh(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderWidget(),
                const SizedBox(height: AppSpacing.xl),
                _DScoreRingWidget(score: stats.dscore),
                const SizedBox(height: AppSpacing.xl),
                _ImpactEquivalencyList(carbon: stats.todayCarbon),
                const SizedBox(height: AppSpacing.xl),
                _AnalyticsSummaryWidget(stats: stats),
                const SizedBox(height: AppSpacing.xl),
                _DeviceUsageWidget(hours: stats.todayUsageHours),
                const SizedBox(height: AppSpacing.xl),
                const _ManualFootprintSection(),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerLoading(width: 200, height: 28),
              const SizedBox(height: AppSpacing.sm),
              const ShimmerLoading(width: 150, height: 16),
              const SizedBox(height: AppSpacing.xl),
              const ShimmerLoading(width: double.infinity, height: 200),
              const SizedBox(height: AppSpacing.xl),
              const ShimmerLoading(width: double.infinity, height: 120),
              const SizedBox(height: AppSpacing.xl),
              const ShimmerLoading(width: double.infinity, height: 160),
              const SizedBox(height: AppSpacing.xl),
              const ShimmerLoading(width: double.infinity, height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Eco-Life',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            GestureDetector(
              onTap: () {},
              child: Hero(
                tag: 'profile-pic',
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.forestGreen, width: 2),
                  ),
                  child: const Icon(Icons.person, color: AppColors.forestGreen, size: 24),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Your personal digital footprint summary',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey600,
              ),
        ),
      ],
    );
  }
}

class _DScoreRingWidget extends StatelessWidget {
  final double score;
  const _DScoreRingWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    final level = _getScoreLevel(score);
    final color = _getScoreColor(score);
    final progress = (score / 100).clamp(0.0, 1.0);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: const CircularProgressIndicator(
                value: 1,
                strokeWidth: 12,
                backgroundColor: AppColors.grey200,
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.transparent,
                color: color,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  score.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  level,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.grey600,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Digital Sustainability Score',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.grey600,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  String _getScoreLevel(double score) {
    if (score < 25) return 'Needs Improvement';
    if (score < 50) return 'Average';
    if (score < 75) return 'Good';
    return 'Excellent';
  }

  Color _getScoreColor(double score) {
    if (score < 25) return AppColors.warning;
    if (score < 50) return AppColors.grey500;
    if (score < 75) return AppColors.leafGreen;
    return AppColors.success;
  }
}

class _DeviceUsageWidget extends StatelessWidget {
  final double hours;
  const _DeviceUsageWidget({required this.hours});

  @override
  Widget build(BuildContext context) {
    return EcoCard(
      onTap: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.leafGreen.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phone_android, color: AppColors.leafGreen, size: 32),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Device Usage', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${hours.toStringAsFixed(1)} active hours today',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
                    ),
                  ],
                ),
              ),
              Text(
                '${hours.toStringAsFixed(1)}h',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.leafGreen,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Screen Time', style: Theme.of(context).textTheme.labelSmall),
                    Text('2h 30m', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Apps Used', style: Theme.of(context).textTheme.labelSmall),
                    Text('12 apps', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
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

  static const List<String> _activityOptions = [
    'Email',
    'Search',
    'Cloud Storage',
    'Social Media',
    'Gaming',
    'Music Streaming',
    'Video Streaming',
    'Video Call',
    'File Download',
    'Website Browsing',
  ];

  static const Map<String, String> _unitOptions = {
    'Email': 'emails',
    'Search': 'searches',
    'Cloud Storage': 'GB',
    'Social Media': 'hours',
    'Gaming': 'hours',
    'Music Streaming': 'hours',
    'Video Streaming': 'hours',
    'Video Call': 'hours',
    'File Download': 'GB',
    'Website Browsing': 'minutes',
  };

  @override
  void initState() {
    super.initState();
    _loadRecentRecords();
  }

  Future<void> _loadRecentRecords() async {
    final repo = await ref.watch(carbonRepositoryProvider.future);
    final records = await repo.getAllRecords();
    setState(() {
      _recentRecords = records.take(5).toList();
    });
  }

  @override
  void dispose() {
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
                value: _selectedActivity.isNotEmpty ? _selectedActivity : null,
                items: _activityOptions
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedActivity = value ?? ''),
                decoration: const InputDecoration(
                  labelText: 'Select Activity',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _valueController,
                      decoration: InputDecoration(
                        labelText: 'Value (${_unitOptions[_selectedActivity] ?? ''})',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && _selectedActivity.isNotEmpty) {
                        HapticFeedback.lightImpact();
                        final value = double.tryParse(_valueController.text) ?? 0;
                        final record = _calculateRecord(_selectedActivity, value);

                        final repo = await ref.watch(carbonRepositoryProvider.future);
                        await repo.saveRecord(record);

                        setState(() {
                          _recentRecords.insert(0, record);
                          if (_recentRecords.length > 5) _recentRecords.removeLast();
                          _valueController.clear();
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
                ..._recentRecords.map((r) => _CarbonRecordTile(record: r)).toList(),
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
        return CarbonCalculator.calculateSearch(searchCount: value.toInt());
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
      case 'Website Browsing':
        return CarbonCalculator.calculateWebBrowsing(minutes: value);
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

class _AnalyticsSummaryWidget extends StatelessWidget {
  final DashboardStats stats;
  const _AnalyticsSummaryWidget({required this.stats});

  @override
  Widget build(BuildContext context) {
    return EcoCard(
      onTap: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly Summary', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _SummaryItem(label: 'Weekly Change', value: '${stats.weeklyChange.toStringAsFixed(1)}kg'),
              const SizedBox(width: AppSpacing.md),
              _SummaryItem(label: 'Streak', value: '${stats.streakDays} days'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.grey600)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
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
