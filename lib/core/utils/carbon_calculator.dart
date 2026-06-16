import 'package:ecodcf/core/constants/emission_factors.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:uuid/uuid.dart';

class CarbonCalculator {
  static CarbonRecord calculateDeviceEnergy({
    required double watts,
    required double hours,
    String? deviceName,
  }) {
    final kwh = (watts * hours) / 1000;
    final kgCO2 = kwh * EmissionFactors.electricityGlobalAverage;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'device_energy',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'watts': watts,
        'hours': hours,
        'kwh': kwh,
        'deviceName': deviceName ?? 'Unknown Device',
      },
    );
  }

  static CarbonRecord calculateDataUsage({
    required double gigabytes,
    required bool isWifi,
  }) {
    final factor = isWifi ? EmissionFactors.dataTransferWifi : EmissionFactors.dataTransferMobile;
    final kgCO2 = gigabytes * factor;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'data_usage',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'gb': gigabytes,
        'connectionType': isWifi ? 'WiFi' : 'Mobile Data',
      },
    );
  }

  static CarbonRecord calculateStreaming({
    required double hours,
    required String quality,
  }) {
    double factor;
    switch (quality.toUpperCase()) {
      case 'FULLHD':
        factor = EmissionFactors.streamingFullHD;
      case 'HD':
        factor = EmissionFactors.streamingHD;
      case 'SD':
        factor = EmissionFactors.streamingSD;
      default:
        factor = EmissionFactors.streamingSD;
    }

    final kgCO2 = hours * factor;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'streaming',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'hours': hours,
        'quality': quality,
      },
    );
  }

  static CarbonRecord calculateAIUsage({
    required int promptCount,
  }) {
    final kgCO2 = promptCount * EmissionFactors.aiPromptAverage;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'ai_usage',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'prompts': promptCount,
      },
    );
  }

  static CarbonRecord calculateEmail({
    required int count,
    required bool hasAttachment,
  }) {
    final factor = hasAttachment ? EmissionFactors.emailWithAttachment : EmissionFactors.emailStandard;
    final kgCO2 = count * factor;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'email',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'count': count,
        'hasAttachment': hasAttachment,
      },
    );
  }

  static CarbonRecord calculateSearch({
    required int searchCount,
  }) {
    final kgCO2 = searchCount * EmissionFactors.searchGoogle;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'search',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'searchCount': searchCount,
      },
    );
  }

  static CarbonRecord calculateCloudStorage({
    required double gbStored,
    required double gbTransferred,
  }) {
    final kgCO2 = (gbStored * EmissionFactors.dataTransferWifi * 0.05) + 
                  (gbTransferred * EmissionFactors.dataTransferWifi);

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'cloud_storage',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'gbStored': gbStored,
        'gbTransferred': gbTransferred,
      },
    );
  }

  static CarbonRecord calculateSocialMedia({
    required double hours,
    required int posts,
  }) {
    final kgCO2 = (hours * EmissionFactors.streamingSD * 0.5) + (posts * EmissionFactors.emailStandard * 0.1);

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'social_media',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'hours': hours,
        'posts': posts,
      },
    );
  }

  static CarbonRecord calculateGaming({
    required double hours,
    required String platform,
  }) {
    double factor;
    switch (platform.toLowerCase()) {
      case 'console':
        factor = 0.2;
      case 'pc':
        factor = 0.15;
      case 'mobile':
        factor = 0.05;
      default:
        factor = 0.1;
    }
    final kgCO2 = hours * factor;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'gaming',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'hours': hours,
        'platform': platform,
      },
    );
  }

  static CarbonRecord calculateMusicStreaming({
    required double hours,
  }) {
    final kgCO2 = hours * EmissionFactors.streamingSD * 0.2;

    return CarbonRecord(
      id: const Uuid().v4(),
      type: 'music_streaming',
      carbonValue: kgCO2,
      unit: 'kg CO2e',
      createdAt: DateTime.now(),
      metadata: {
        'hours': hours,
      },
    );
  }
}

