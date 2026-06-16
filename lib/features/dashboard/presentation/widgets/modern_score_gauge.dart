import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:flutter/services.dart';

class ModernScoreGauge extends StatefulWidget {
  final double score;
  final double size;

  const ModernScoreGauge({
    super.key,
    required this.score,
    this.size = 200,
  });

  @override
  State<ModernScoreGauge> createState() => _ModernScoreGaugeState();
}

class _ModernScoreGaugeState extends State<ModernScoreGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.score).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(ModernScoreGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.score != widget.score) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.score,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutSine));
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            _controller.reset();
            _controller.forward();
          },
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _GaugePainter(
              score: _animation.value,
              color: _getScoreColor(_animation.value),
            ),
          ),
        );
      },
    );
  }

  Color _getScoreColor(double score) {
    if (score < 25) return AppColors.error;
    if (score < 50) return AppColors.warning;
    if (score < 75) return AppColors.leafGreen;
    return AppColors.success;
  }
}

class _GaugePainter extends CustomPainter {
  final double score;
  final Color color;

  _GaugePainter({required this.score, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    const strokeWidth = 14.0;

    // Background track
    final trackPaint = Paint()
      ..color = AppColors.grey200.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      pi * 0.75,
      pi * 1.5,
      false,
      trackPaint,
    );

    // Active progress with gradient
    final progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [color.withValues(alpha: 0.5), color],
        stops: const [0.0, 1.0],
        startAngle: pi * 0.75,
        endAngle: pi * 0.75 + (pi * 1.5 * (score / 100)),
        transform: const GradientRotation(pi * 0.75),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      pi * 0.75,
      (pi * 1.5 * (score / 100)).clamp(0.01, pi * 1.5),
      false,
      progressPaint,
    );

    // Glow effect
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      pi * 0.75,
      (pi * 1.5 * (score / 100)).clamp(0.01, pi * 1.5),
      false,
      glowPaint,
    );

    // Score text
    final textPainter = TextPainter(
      text: TextSpan(
        text: score.toInt().toString(),
        style: TextStyle(
          fontSize: radius * 0.6,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2 + 10),
    );

    final labelPainter = TextPainter(
      text: const TextSpan(
        text: 'D-SCORE',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.grey600,
          letterSpacing: 2,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    labelPainter.paint(
      canvas,
      center - Offset(labelPainter.width / 2, -radius * 0.3),
    );
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.color != color;
  }
}
