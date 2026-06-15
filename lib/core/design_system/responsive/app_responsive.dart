import 'package:flutter/material.dart';

class AppResponsive {
  static double r(BuildContext context, double value) {
    final width = MediaQuery.of(context).size.width;
    return value * (width / 375);
  }
}