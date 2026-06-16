import 'package:flutter_test/flutter_test.dart';
import 'package:ecodcf/core/utils/carbon_calculator.dart';

void main() {
  group('CarbonCalculator', () {
    group('calculateEmail', () {
      test('returns correct carbon for 10 emails without attachment', () {
        final record = CarbonCalculator.calculateEmail(count: 10, hasAttachment: false);
        expect(record.carbonValue, closeTo(0.04, 0.001));
        expect(record.type, equals('email'));
      });

      test('returns correct carbon for 5 emails with attachment', () {
        final record = CarbonCalculator.calculateEmail(count: 5, hasAttachment: true);
        expect(record.carbonValue, closeTo(0.25, 0.001));
        expect(record.type, equals('email'));
      });
    });

    group('calculateSearch', () {
      test('returns correct carbon for 20 searches', () {
        final record = CarbonCalculator.calculateSearch(searchCount: 20);
        expect(record.carbonValue, closeTo(0.004, 0.001));
        expect(record.type, equals('search'));
      });
    });

    group('calculateStreaming', () {
      test('returns correct carbon for 2 hours of HD streaming', () {
        final record = CarbonCalculator.calculateStreaming(hours: 2, quality: 'HD');
        expect(record.carbonValue, closeTo(0.12, 0.001));
        expect(record.type, equals('streaming'));
      });

      test('returns correct carbon for 1 hour of 4K streaming', () {
        final record = CarbonCalculator.calculateStreaming(hours: 1, quality: '4K');
        expect(record.carbonValue, closeTo(0.02, 0.01));
        expect(record.type, equals('streaming'));
      });
    });

    group('calculateGaming', () {
      test('returns correct carbon for console gaming', () {
        final record = CarbonCalculator.calculateGaming(hours: 3, platform: 'console');
        expect(record.carbonValue, closeTo(0.6, 0.001));
        expect(record.type, equals('gaming'));
      });

      test('returns correct carbon for mobile gaming', () {
        final record = CarbonCalculator.calculateGaming(hours: 2, platform: 'mobile');
        expect(record.carbonValue, closeTo(0.1, 0.001));
        expect(record.type, equals('gaming'));
      });
    });

    group('calculateMusicStreaming', () {
      test('returns correct carbon for 4 hours of music streaming', () {
        final record = CarbonCalculator.calculateMusicStreaming(hours: 4);
        expect(record.carbonValue, closeTo(0.016, 0.001));
        expect(record.type, equals('music_streaming'));
      });
    });

    group('calculateCloudStorage', () {
      test('returns correct carbon for 100GB stored and transferred', () {
        final record = CarbonCalculator.calculateCloudStorage(gbStored: 100, gbTransferred: 100);
        expect(record.carbonValue, closeTo(1.26, 0.1));
        expect(record.type, equals('cloud_storage'));
      });
    });

    group('calculateSocialMedia', () {
      test('returns correct carbon for 1 hour of social media', () {
        final record = CarbonCalculator.calculateSocialMedia(hours: 1, posts: 0);
        expect(record.carbonValue, closeTo(0.01, 0.001));
        expect(record.type, equals('social_media'));
      });
    });

    group('calculateVideoCall', () {
      test('returns correct carbon for 1 hour of HD video call', () {
        final record = CarbonCalculator.calculateVideoCall(hours: 1, quality: 'HD');
        expect(record.carbonValue, closeTo(0.09, 0.01));
        expect(record.type, equals('video_call'));
      });
    });

    group('calculateFileDownload', () {
      test('returns correct carbon for 500MB download', () {
        final record = CarbonCalculator.calculateFileDownload(gb: 0.5);
        expect(record.carbonValue, closeTo(0.0006, 0.0001));
        expect(record.type, equals('file_download'));
      });
    });

    group('calculateWebBrowsing', () {
      test('returns correct carbon for 30 minutes of browsing', () {
        final record = CarbonCalculator.calculateWebBrowsing(minutes: 30);
        expect(record.carbonValue, closeTo(0.001, 0.001));
        expect(record.type, equals('web_browsing'));
      });
    });

    group('calculateDeviceEnergy', () {
      test('returns correct carbon for 60W device for 2 hours', () {
        final record = CarbonCalculator.calculateDeviceEnergy(watts: 60, hours: 2);
        expect(record.carbonValue, closeTo(0.052, 0.001));
        expect(record.type, equals('device_energy'));
      });
    });
  });
}