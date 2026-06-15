import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';

class DScoreService {
  /// The target maximum digital carbon footprint per day (in kg CO2e)
  /// Based on aiming for a personal digital footprint of ~300kg per year.
  static const double dailySustainableTarget = 0.82; // ~300kg / 365 days

  /// Calculate the D-Score based on total carbon emitted
  static DScore calculateDailyScore({
    required List<CarbonRecord> records,
    required DateTime date,
  }) {
    if (records.isEmpty) {
      return DScore(score: 100, level: 'Digital Guardian', date: date);
    }

    final totalCarbon = records.fold(0.0, (sum, record) => sum + record.carbonValue);
    
    // Score calculation logic:
    // 100 points if totalCarbon <= dailySustainableTarget
    // Decreases as emissions increase. 
    // If emissions are 3x the target, score approaches 0.
    double score = 100 * (1 - (totalCarbon / (dailySustainableTarget * 3)));
    
    // Clamp score between 0 and 100
    score = score.clamp(0.0, 100.0);

    final dscore = DScore(
      score: score,
      date: date,
      breakdown: _calculateBreakdown(records),
    );

    return dscore.copyWith(level: dscore.getLevelName());
  }

  static Map<String, double> _calculateBreakdown(List<CarbonRecord> records) {
    final Map<String, double> breakdown = {};
    for (var record in records) {
      breakdown[record.type] = (breakdown[record.type] ?? 0.0) + record.carbonValue;
    }
    return breakdown;
  }

  /// Returns advice based on the D-Score
  static String getAdvice(double score) {
    if (score >= 90) return 'Excellent work! Your digital habits are highly sustainable.';
    if (score >= 75) return 'Great job. You are a Sustainability Champion. Try reducing 4K streaming to reach 90+.';
    if (score >= 50) return 'You are an Optimizer. Consider cleaning up your cloud storage to boost your score.';
    if (score >= 25) return 'You are an Aware User. Reducing background data usage could help you improve.';
    return 'Your digital footprint is high. Try using Wi-Fi instead of mobile data and reducing screen time.';
  }
}

