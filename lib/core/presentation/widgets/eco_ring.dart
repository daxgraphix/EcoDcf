import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/app_design_system.dart';

class ECORing extends StatelessWidget {
  final double value;
  final double maxValue;
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final String? label;
  final String? valueLabel;
  final bool animated;

  const ECORing({
    super.key,
    required this.value,
    this.maxValue = 100,
    this.size = 200,
    this.strokeWidth = 12,
    this.backgroundColor = AppColors.grey200,
    this.foregroundColor = AppColors.forestGreen,
    this.label,
    this.valueLabel,
    this.animated = true,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (value / maxValue).clamp(0.0, 1.0);

    return Stack(
      alignment: Alignment.center,
      children: [
        if (animated)
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  backgroundColor.withValues(alpha: 0.5),
                  backgroundColor.withValues(alpha: 0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: _ECORingPainter(
              progress: progress,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              animated: animated,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Text(
                label!,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: foregroundColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              valueLabel ?? value.toStringAsFixed(1),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ECORingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool animated;

  _ECORingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
    this.animated = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, backgroundPaint);

    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ECORingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.strokeWidth != strokeWidth ||
           oldDelegate.foregroundColor != foregroundColor;
  }
}

class DScoreRing extends StatelessWidget {
  final double score;
  final double size;
  final String? level;

  const DScoreRing({
    super.key,
    required this.score,
    this.size = 200,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    return ECORing(
      value: score,
      maxValue: 100,
      size: size,
      label: 'D-SCORE',
      valueLabel: score.toStringAsFixed(0),
      foregroundColor: _getScoreColor(score),
    );
  }

  Color _getScoreColor(double score) {
    if (score < 25) return AppColors.warning;
    if (score < 50) return AppColors.grey500;
    if (score < 75) return AppColors.leafGreen;
    return AppColors.success;
  }
}

class EcoProgressRing extends StatelessWidget {
  final double value;
  final double maxValue;
  final double size;
  final Color color;
  final String label;
  final String unit;

  const EcoProgressRing({
    super.key,
    required this.value,
    this.maxValue = 100,
    this.size = 120,
    this.color = AppColors.forestGreen,
    required this.label,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    return ECORing(
      value: value,
      maxValue: maxValue,
      size: size,
      label: label,
      valueLabel: '$value${unit.isNotEmpty ? unit : ''}',
      foregroundColor: color,
    );
  }
}
