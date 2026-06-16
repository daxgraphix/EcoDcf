import 'package:ecodcf/core/utils/sharing/impact_report_generator.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/core/routes/app_routes.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';
import 'package:ecodcf/features/dashboard/presentation/bloc/dashboard_notifier.dart';
import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final prefsAsync = ref.watch(userPreferencesProvider);
    
    final stats = dashboardAsync.maybeWhen(
      data: (data) => data,
      orElse: () => const DashboardStats(),
    );

    final userName = prefsAsync.maybeWhen(
      data: (prefs) => prefs.userName ?? 'Eco Guardian',
      orElse: () => 'Eco Guardian',
    );

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.forestGreen, AppColors.leafGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: AppColors.forestGreen),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: Colors.white70),
                            onPressed: () => _showEditNameDialog(context, ref, userName),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileStatsCard(stats: stats),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    'Quick Actions',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildProfileOption(
                    context, 
                    Icons.history, 
                    'Carbon History', 
                    'View and manage your digital footprint',
                    () => context.push(AppRoutes.activityHistory),
                  ),
                  _buildProfileOption(
                    context, 
                    Icons.share, 
                    'Share Impact', 
                    'Inspire others with your progress',
                    () => _showShareDialog(context, stats, userName),
                  ),
                  _buildProfileOption(
                    context, 
                    Icons.settings, 
                    'Settings', 
                    'Preferences and privacy',
                    () => context.push(AppRoutes.settings),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditNameDialog(BuildContext context, WidgetRef ref, String currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Full Name',
            hintText: 'Enter your name',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                HapticFeedback.lightImpact();
                ref.read(userPreferencesProvider.notifier).updateName(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.forestGreen),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
      ),
    );
  }

  void _showShareDialog(BuildContext context, DashboardStats stats, String userName) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share Your Impact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Spread awareness about digital sustainability by sharing your journey.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grey600),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ShareAction(
                  icon: Icons.picture_as_pdf, 
                  label: 'PDF Report', 
                  onTap: () async {
                    Navigator.pop(context);
                    final file = await ImpactReportGenerator.generatePdf(stats, userName);
                    await Printing.sharePdf(bytes: await file.readAsBytes(), filename: 'EcoDcf_Impact.pdf');
                  },
                ),
                _ShareAction(
                  icon: Icons.print, 
                  label: 'Print', 
                  onTap: () async {
                    Navigator.pop(context);
                    final file = await ImpactReportGenerator.generatePdf(stats, userName);
                    await Printing.layoutPdf(onLayout: (format) async => await file.readAsBytes());
                  },
                ),
                _ShareAction(
                  icon: Icons.copy, 
                  label: 'Stats', 
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                      text: "My Digital Carbon Impact: ${stats.totalCarbon.toStringAsFixed(1)}kg CO2e. "
                           "I've saved ${stats.totalSaved.toStringAsFixed(1)}kg so far! #EcoDcf #Sustainability"
                    ));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Stats copied to clipboard!')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ProfileStatsCard extends StatelessWidget {
  final DashboardStats stats;
  const _ProfileStatsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatColumn(
              label: 'Total Saved',
              value: '${stats.totalCarbon.toStringAsFixed(1)}kg',
              icon: Icons.eco,
              color: AppColors.forestGreen,
            ),
            _StatColumn(
              label: 'D-Score',
              value: stats.dscore.toInt().toString(),
              icon: Icons.speed,
              color: AppColors.ecoBlue,
            ),
            _StatColumn(
              label: 'Streak',
              value: '${stats.streakDays}d',
              icon: Icons.local_fire_department,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatColumn({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.grey600),
        ),
      ],
    );
  }
}

class _ShareAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShareAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.forestGreen),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
