import 'package:flutter/material.dart';

class EcoInsight {
  final String title;
  final String message;
  final IconData icon;
  final Color color;
  final String actionLabel;
  final VoidCallback? onAction;

  const EcoInsight({
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
    required this.actionLabel,
    this.onAction,
  });
}
