import 'package:flutter_test/flutter_test.dart';
import 'package:ecodcf/core/services/carbon_calculators.dart';

void main() {
  group('DeviceEnergyCalculator', () {
    test('calculates energy consumption correctly', () {
      final calculator = DeviceEnergyCalculator(
        activeHours: 2.0,
        powerConsumptionWatts: 60.0,
        deviceType: 'laptop',
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.057, 0.001));
    });
  });

  group('NetworkUsageCalculator', () {
    test('calculates network impact for WiFi', () {
      final calculator = NetworkUsageCalculator(
        dataGb: 10.0,
        networkType: 'wifi',
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.67, 0.01));
    });
  });

  group('VideoStreamingCalculator', () {
    test('calculates streaming impact for HD', () {
      final calculator = VideoStreamingCalculator(
        viewingHours: 1.0,
        resolution: 'hd',
        platform: 'youtube',
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.125, 0.01));
    });
  });

  group('EmailImpactCalculator', () {
    test('calculates email impact', () {
      final calculator = EmailImpactCalculator(
        emailsSent: 50,
        emailsReceived: 100,
        attachmentSizeMb: 10.0,
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.055, 0.001));
    });
  });

  group('CloudStorageCalculator', () {
    test('calculates cloud storage impact', () {
      final calculator = CloudStorageCalculator(
        storageGb: 100.0,
        syncGb: 10.0,
        provider: 'google_drive',
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.025, 0.001));
    });
  });

  group('AIUsageCalculator', () {
    test('calculates AI usage impact', () {
      final calculator = AIUsageCalculator(
        prompts: 100,
        sessions: 10,
        model: 'gpt-4',
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.2, 0.01));
    });
  });

  group('SearchQueriesCalculator', () {
    test('calculates search impact', () {
      final calculator = SearchQueriesCalculator(
        dailySearches: 50,
        searchFrequency: 365,
      );
      final result = calculator.calculate();
      expect(result.kgCO2e, closeTo(0.01, 0.001));
    });
  });
}

