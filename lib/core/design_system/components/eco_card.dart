import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/design_system/spacing.dart';
import 'package:ecodcf/core/design_system/radius.dart';

class EcoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onTap;
  
  const EcoCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.elevation,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation ?? 2,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
      ),
    );
  }
}

class EcoCardVariant extends StatelessWidget {
  final Widget child;
  final String title;
  final Color? leadingColor;
  
  const EcoCardVariant({
    super.key,
    required this.child,
    required this.title,
    this.leadingColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return EcoCard(
      backgroundColor: (leadingColor ?? AppColors.forestGreen).withValues(alpha: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}
