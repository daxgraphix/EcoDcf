import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/providers/privacy_provider.dart';
import 'package:ecodcf/core/services/permissions/privacy_transparency_service.dart';
import 'package:ecodcf/core/design_system/spacing.dart';
import 'package:ecodcf/core/design_system/radius.dart';

class PrivacyCenterPage extends ConsumerWidget {
  const PrivacyCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyService = ref.watch(privacyServiceProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Center'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Data & Privacy',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'EcoDcf is designed with an offline-first, privacy-focused approach. We only collect data necessary to calculate your digital impact.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xl),
            
            Text(
              'Required Permissions',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            ...privacyService.requirements.map((req) => _PermissionCard(requirement: req)),
            
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Module Transparency',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            _TransparencyTile(
              title: 'Carbon Tracking',
              report: privacyService.getModuleTransparency('carbon_tracking'),
            ),
            const SizedBox(height: AppSpacing.md),
            _TransparencyTile(
              title: 'AI Usage Tracking',
              report: privacyService.getModuleTransparency('ai_tracking'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionCard extends ConsumerWidget {
  final PermissionRequirement requirement;

  const _PermissionCard({required this.requirement});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    requirement.title,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                // We could add a status icon here using the permissionStatusProvider
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              requirement.description,
              style: theme.textTheme.bodySmall,
            ),
            const Divider(height: AppSpacing.lg),
            _InfoRow(label: 'Data Collected', value: requirement.dataCollected),
            const SizedBox(height: AppSpacing.xs),
            _InfoRow(label: 'Justification', value: requirement.justification),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _TransparencyTile extends StatelessWidget {
  final String title;
  final Map<String, String> report;

  const _TransparencyTile({required this.title, required this.report});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...report.entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodySmall,
                      children: [
                        TextSpan(text: '${e.key}: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: e.value),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

