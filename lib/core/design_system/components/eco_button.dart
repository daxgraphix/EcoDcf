import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/design_system/spacing.dart';
import 'package:ecodcf/core/design_system/radius.dart';

class EcoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  
  const EcoButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
  });
  
  Widget _buildChild([Color? customTextColor]) {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return Text(
      text,
      style: TextStyle(color: customTextColor ?? textColor ?? AppColors.light),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(AppSpacing.lg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              foregroundColor: backgroundColor ?? AppColors.forestGreen,
              side: BorderSide(
                color: backgroundColor ?? AppColors.forestGreen,
              ),
            ),
            child: _buildChild(backgroundColor),
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.forestGreen,
              foregroundColor: textColor ?? AppColors.light,
              padding: const EdgeInsets.all(AppSpacing.lg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
            ),
            child: _buildChild(),
          );
  }
}

class EcoIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color? backgroundColor;
  final double? size;
  
  const EcoIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size ?? 24,
        color: backgroundColor ?? AppColors.forestGreen,
      ),
      style: IconButton.styleFrom(
        backgroundColor: (backgroundColor ?? AppColors.forestGreen).withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }
}
