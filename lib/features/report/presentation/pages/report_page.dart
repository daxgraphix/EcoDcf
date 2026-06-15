import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/report/presentation/services/report_service.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportService = ReportService();

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Carbon Reports', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.xl),
            _ReportOption(
              icon: Icons.picture_as_pdf,
              title: 'Weekly Report',
              subtitle: 'Generate weekly carbon footprint report',
              onTap: () => _generateReport(context, reportService, 'Weekly'),
            ),
            const SizedBox(height: AppSpacing.md),
            _ReportOption(
              icon: Icons.picture_as_pdf,
              title: 'Monthly Report',
              subtitle: 'Generate monthly carbon footprint report',
              onTap: () => _generateReport(context, reportService, 'Monthly'),
            ),
            const SizedBox(height: AppSpacing.md),
            _ReportOption(
              icon: Icons.picture_as_pdf,
              title: 'Yearly Report',
              subtitle: 'Generate yearly carbon footprint report',
              onTap: () => _generateReport(context, reportService, 'Yearly'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateReport(BuildContext context, ReportService service, String period) async {
    unawaited(showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    ));

    try {
      final bytes = await service.generateCarbonReport(
        totalCarbon: 12.5,
        records: [
          {'date': '2024-01-15', 'type': 'Device', 'value': 2.5},
          {'date': '2024-01-16', 'type': 'Streaming', 'value': 1.8},
        ],
        period: period,
      );

      if (context.mounted) {
        Navigator.pop(context);
        await service.shareReport(bytes);
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }
}

class _ReportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ReportOption({required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppColors.forestGreen),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

