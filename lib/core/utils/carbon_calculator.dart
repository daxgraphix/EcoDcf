import 'package:ecodcf/core/constants/emission_factors.dart';
import 'package:ecodcf/features/carbon/domain/entities/carbon_record.dart';
import 'package:uuid/uuid.dart';

class CarbonCalculator {
  static CarbonRecord calculateDeviceEnergy({
    required double watts,
    required double hours,
    String? deviceName,
  }) {
    // kWh = (Watts * Hours) / 1000
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
    required String quality, // 'SD', 'HD', 'FullHD'
  }) {
    double factor;
    switch (quality.toUpperCase()) {
      case 'FULLHD':
        factor = EmissionFactors.streamingFullHD;
        break;
      case 'HD':
        factor = EmissionFactors.streamingHD;
        break;
      case 'SD':
      default:
        factor = EmissionFactors.streamingSD;
        break;
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
}

