import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/device_usage/providers/device_usage_providers.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/core/routes/app_routes.dart';

class DeviceUsagePage extends ConsumerWidget {
  const DeviceUsagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usageAsync = ref.watch(deviceUsageListProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Device Usage'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.main),
        ),
      ),
      body: usageAsync.when(
        data: (usage) {
          if (usage.isEmpty) {
            return const Center(child: Text('No device usage data yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: usage.length,
            itemBuilder: (context, index) {
              final item = usage[index];
              return _DeviceUsageTile(usage: item);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _DeviceUsageTile extends StatelessWidget {
  final DeviceUsage usage;
  const _DeviceUsageTile({required this.usage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.devices, color: AppColors.forestGreen),
        ),
        title: Text(
          usage.deviceName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${usage.deviceType} • ${usage.activeHours.toStringAsFixed(1)}h active',
              style: const TextStyle(color: AppColors.grey600, fontSize: 12),
            ),
            Text(
              '${usage.screenTimeMinutes.toStringAsFixed(0)} min screen time',
              style: const TextStyle(color: AppColors.grey500, fontSize: 11),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${usage.powerConsumptionWatts.toStringAsFixed(1)}W',
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.forestGreen),
            ),
            const Text('Power', style: TextStyle(fontSize: 10, color: AppColors.grey500)),
          ],
        ),
      ),
    );
  }
}