import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String actionText;

  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onActionPressed,
    this.actionText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.grey300,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.grey600, size: 40),
            ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey600,
                ),
            textAlign: TextAlign.center,
          ),
          if (onActionPressed != null) ...[
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: onActionPressed,
              child: Text(actionText),
            ),
          ],
        ],
      ),
    );
  }
}
