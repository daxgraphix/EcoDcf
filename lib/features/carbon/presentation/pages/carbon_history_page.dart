import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/carbon/providers/carbon_providers.dart';
import 'package:intl/intl.dart';

class CarbonHistoryPage extends ConsumerWidget {
  const CarbonHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(carbonRecordsStreamProvider);

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Carbon History'),
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      floatingActionButton: Navigator.canPop(context)
          ? FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: AppColors.forestGreen,
              child: const Icon(Icons.arrow_back, color: Colors.white),
            )
          : null,
      body: recordsAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('No history available yet.'));
          }
          final sortedRecords = [...records]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
          
          return ListView.builder(
            padding: const EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.xl),
            itemCount: sortedRecords.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final record = sortedRecords[index];
              return _HistoryCard(record: record);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _HistoryCard extends ConsumerWidget {
  final CarbonRecord record;
  const _HistoryCard({required this.record});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: const Icon(Icons.co2, color: AppColors.forestGreen),
        ),
        title: Text(
          record.type.replaceAll('_', ' ').toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          DateFormat('MMM dd, yyyy • HH:mm').format(record.createdAt),
          style: const TextStyle(color: AppColors.grey600, fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${record.carbonValue.toStringAsFixed(2)} kg',
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.forestGreen),
            ),
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'edit') {
                  _showEditDialog(context, ref, record);
                } else if (value == 'delete') {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Record'),
                      content: const Text('Are you sure you want to delete this record?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete', style: TextStyle(color: AppColors.forestGreen)),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    final repo = await ref.read(carbonRepositoryProvider.future);
                    await repo.deleteRecord(record.id);
                  }
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete', style: TextStyle(color: AppColors.forestGreen)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, CarbonRecord record) {
    final TextEditingController controller = TextEditingController(
      text: record.carbonValue.toStringAsFixed(3),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Record'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Activity: ${record.type.replaceAll('_', ' ').toUpperCase()}'),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carbon Value (kg CO2e)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final newValue = double.tryParse(controller.text);
              if (newValue != null) {
                final repo = await ref.read(carbonRepositoryProvider.future);
                await repo.saveRecord(record.copyWith(carbonValue: newValue));
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
