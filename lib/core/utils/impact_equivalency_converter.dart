import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';

class ImpactEquivalency {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  ImpactEquivalency({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  /// Converts kg CO2e to various real-world equivalents.
  static List<ImpactEquivalency> getEquivalencies(double kgCO2) {
    if (kgCO2 <= 0) return [];

    // Constants based on global averages
    const double co2PerKmCar = 0.17; // kg CO2/km (Average mid-sized car)
    const double co2PerSmartphoneCharge = 0.0012; // kg CO2 (approx 0.01 kWh * 0.12 kg/kWh carbon intensity)
    const double co2PerLedHour = 0.004; // 10W LED * 1hr = 0.01kWh. 0.01 * 0.4kg/kWh = 0.004kg
    const double co2AbsorbedByTreePerDay = 0.055; // ~20kg per year / 365 days

    return [
      ImpactEquivalency(
        label: 'Driving',
        value: '${(kgCO2 / co2PerKmCar).toStringAsFixed(1)} km',
        icon: Icons.directions_car,
        color: AppColors.forestGreen,
      ),
      ImpactEquivalency(
        label: 'Phone Charges',
        value: (kgCO2 / co2PerSmartphoneCharge).toStringAsFixed(0),
        icon: Icons.battery_charging_full,
        color: AppColors.leafGreen,
      ),
      ImpactEquivalency(
        label: 'Bulb Hours',
        value: '${(kgCO2 / co2PerLedHour).toStringAsFixed(0)}h',
        icon: Icons.lightbulb,
        color: AppColors.mintGreen,
      ),
      ImpactEquivalency(
        label: 'Tree Days',
        value: (kgCO2 / co2AbsorbedByTreePerDay).toStringAsFixed(1),
        icon: Icons.park,
        color: AppColors.emeraldGreen,
      ),
    ];
  }
}
