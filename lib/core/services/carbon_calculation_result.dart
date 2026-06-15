class CarbonCalculationResult {
  final double kgCO2e;
  final DateTime timestamp;
  final String category;
  final Map<String, dynamic> details;

  CarbonCalculationResult({
    required this.kgCO2e,
    required this.timestamp,
    required this.category,
    required this.details,
  });
}