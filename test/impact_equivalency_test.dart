import 'package:flutter_test/flutter_test.dart';
import 'package:ecodcf/core/utils/impact_equivalency_converter.dart';

void main() {
  group('ImpactEquivalency.getEquivalencies', () {
    test('returns empty list for 0 carbon', () {
      final result = ImpactEquivalency.getEquivalencies(0);
      expect(result, isEmpty);
    });

    test('calculates driving distance correctly', () {
      final result = ImpactEquivalency.getEquivalencies(0.19); // 1 km
      final driving = result.firstWhere((e) => e.label == 'Driving');
      expect(driving.value, '1.0 km');
    });

    test('calculates phone charges correctly', () {
      final result = ImpactEquivalency.getEquivalencies(0.008); // 1 charge
      final charges = result.firstWhere((e) => e.label == 'Phone Charges');
      expect(charges.value, '1 times');
    });

    test('calculates bulb hours correctly', () {
      final result = ImpactEquivalency.getEquivalencies(0.012); // 1 hour
      final bulb = result.firstWhere((e) => e.label == 'Bulb Hours');
      expect(bulb.value, '1 hrs');
    });

    test('calculates trees correctly', () {
      final result = ImpactEquivalency.getEquivalencies(0.06); // 1 tree/day
      final trees = result.firstWhere((e) => e.label == 'Trees/Day');
      expect(trees.value, '1.00 trees');
    });
  });
}

