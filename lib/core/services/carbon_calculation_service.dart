import 'package:ecodcf/core/services/carbon_calculation_result.dart';
import 'package:ecodcf/core/services/carbon_calculators.dart';

class CarbonCalculationService {
  static CarbonCalculationService? _instance;
  static CarbonCalculationService get instance {
    _instance ??= CarbonCalculationService._();
    return _instance!;
  }

  CarbonCalculationService._();

  CarbonCalculationResult calculateDeviceEnergy({
    required double activeHours,
    required double powerConsumptionWatts,
    required String deviceType,
    double gridCarbonIntensity = 0.475,
  }) {
    return DeviceEnergyCalculator(
      activeHours: activeHours,
      powerConsumptionWatts: powerConsumptionWatts,
      deviceType: deviceType,
      gridCarbonIntensity: gridCarbonIntensity,
    ).calculate();
  }

  CarbonCalculationResult calculateNetworkUsage({
    required double dataGb,
    required String networkType,
  }) {
    return NetworkUsageCalculator(
      dataGb: dataGb,
      networkType: networkType,
    ).calculate();
  }

  CarbonCalculationResult calculateVideoStreaming({
    required double viewingHours,
    required String resolution,
    required String platform,
  }) {
    return VideoStreamingCalculator(
      viewingHours: viewingHours,
      resolution: resolution,
      platform: platform,
    ).calculate();
  }

  CarbonCalculationResult calculateEmailImpact({
    required int emailsSent,
    required int emailsReceived,
    required double attachmentSizeMb,
  }) {
    return EmailImpactCalculator(
      emailsSent: emailsSent,
      emailsReceived: emailsReceived,
      attachmentSizeMb: attachmentSizeMb,
    ).calculate();
  }

  CarbonCalculationResult calculateCloudStorage({
    required double storageGb,
    required double syncGb,
    required String provider,
  }) {
    return CloudStorageCalculator(
      storageGb: storageGb,
      syncGb: syncGb,
      provider: provider,
    ).calculate();
  }

  CarbonCalculationResult calculateAIUsage({
    required int prompts,
    required int sessions,
    required String model,
  }) {
    return AIUsageCalculator(
      prompts: prompts,
      sessions: sessions,
      model: model,
    ).calculate();
  }

  CarbonCalculationResult calculateSearchQueries({
    required int dailySearches,
    required int searchFrequency,
  }) {
    return SearchQueriesCalculator(
      dailySearches: dailySearches,
      searchFrequency: searchFrequency,
    ).calculate();
  }
}
