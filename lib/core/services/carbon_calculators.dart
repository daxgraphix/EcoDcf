import 'package:ecodcf/core/services/carbon_calculation_result.dart';

abstract class CarbonCalculator {
  CarbonCalculationResult calculate();
}

class DeviceEnergyCalculator implements CarbonCalculator {
  final double activeHours;
  final double powerConsumptionWatts;
  final String deviceType;
  final double gridCarbonIntensity;

  DeviceEnergyCalculator({
    required this.activeHours,
    required this.powerConsumptionWatts,
    required this.deviceType,
    this.gridCarbonIntensity = 0.475,
  });

  @override
  CarbonCalculationResult calculate() {
    final energyKwh = (powerConsumptionWatts * activeHours) / 1000;
    final kgCO2e = energyKwh * gridCarbonIntensity;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'device_energy',
      details: {
        'deviceType': deviceType,
        'activeHours': activeHours,
        'energyKwh': energyKwh,
        'gridIntensity': gridCarbonIntensity,
      },
    );
  }
}

class NetworkUsageCalculator implements CarbonCalculator {
  final double dataGb;
  final String networkType;

  NetworkUsageCalculator({
    required this.dataGb,
    required this.networkType,
  });

  @override
  CarbonCalculationResult calculate() {
    double factor = 0.067;
    if (networkType.toLowerCase() == 'mobile') {
      factor = 0.134;
    }

    final kgCO2e = dataGb * factor;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'network_usage',
      details: {
        'dataGb': dataGb,
        'networkType': networkType,
        'factor': factor,
      },
    );
  }
}

class VideoStreamingCalculator implements CarbonCalculator {
  final double viewingHours;
  final String resolution;
  final String platform;

  VideoStreamingCalculator({
    required this.viewingHours,
    required this.resolution,
    required this.platform,
  });

  @override
  CarbonCalculationResult calculate() {
    double factor = 0.125;
    if (resolution.toLowerCase() == '4k') {
      factor = 0.25;
    } else if (resolution.toLowerCase() == 'hd' || resolution.toLowerCase() == '1080p') {
      factor = 0.125;
    } else if (resolution.toLowerCase() == 'sd') {
      factor = 0.0625;
    }

    final kgCO2e = viewingHours * factor;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'video_streaming',
      details: {
        'viewingHours': viewingHours,
        'resolution': resolution,
        'platform': platform,
        'factor': factor,
      },
    );
  }
}

class EmailImpactCalculator implements CarbonCalculator {
  final int emailsSent;
  final int emailsReceived;
  final double attachmentSizeMb;

  EmailImpactCalculator({
    required this.emailsSent,
    required this.emailsReceived,
    required this.attachmentSizeMb,
  });

  @override
  CarbonCalculationResult calculate() {
    const factorPerEmail = 0.0003;
    const factorPerMb = 0.001;

    final emailImpact = (emailsSent + emailsReceived) * factorPerEmail;
    final attachmentImpact = attachmentSizeMb * factorPerMb;
    final kgCO2e = emailImpact + attachmentImpact;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'email_impact',
      details: {
        'emailsSent': emailsSent,
        'emailsReceived': emailsReceived,
        'attachmentSizeMb': attachmentSizeMb,
        'emailImpact': emailImpact,
        'attachmentImpact': attachmentImpact,
      },
    );
  }
}

class CloudStorageCalculator implements CarbonCalculator {
  final double storageGb;
  final double syncGb;
  final String provider;

  CloudStorageCalculator({
    required this.storageGb,
    required this.syncGb,
    required this.provider,
  });

  @override
  CarbonCalculationResult calculate() {
    const storageFactor = 0.0002;
    const syncFactor = 0.0005;

    final storageImpact = storageGb * storageFactor;
    final syncImpact = syncGb * syncFactor;
    final kgCO2e = storageImpact + syncImpact;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'cloud_storage',
      details: {
        'storageGb': storageGb,
        'syncGb': syncGb,
        'provider': provider,
        'storageImpact': storageImpact,
        'syncImpact': syncImpact,
      },
    );
  }
}

class AIUsageCalculator implements CarbonCalculator {
  final int prompts;
  final int sessions;
  final String model;

  AIUsageCalculator({
    required this.prompts,
    required this.sessions,
    required this.model,
  });

  @override
  CarbonCalculationResult calculate() {
    double factor = 0.001;
    if (model.toLowerCase().contains('gpt-4') || model.toLowerCase().contains('claude')) {
      factor = 0.002;
    } else if (model.toLowerCase().contains('gemini')) {
      factor = 0.0015;
    }

    final kgCO2e = prompts * factor;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'ai_usage',
      details: {
        'prompts': prompts,
        'sessions': sessions,
        'model': model,
        'factor': factor,
      },
    );
  }
}

class SearchQueriesCalculator implements CarbonCalculator {
  final int dailySearches;
  final int searchFrequency;

  SearchQueriesCalculator({
    required this.dailySearches,
    required this.searchFrequency,
  });

  @override
  CarbonCalculationResult calculate() {
    const factorPerSearch = 0.0002;

    final kgCO2e = dailySearches * factorPerSearch;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'search_queries',
      details: {
        'dailySearches': dailySearches,
        'searchFrequency': searchFrequency,
        'factor': factorPerSearch,
      },
    );
  }
}

class SocialMediaCalculator implements CarbonCalculator {
  final double screenTimeHours;
  final String platform;

  SocialMediaCalculator({
    required this.screenTimeHours,
    required this.platform,
  });

  @override
  CarbonCalculationResult calculate() {
    double factor = 0.05;
    if (platform.toLowerCase() == 'tiktok') {
      factor = 0.1;
    } else if (platform.toLowerCase() == 'youtube') {
      factor = 0.08;
    }

    final kgCO2e = screenTimeHours * factor;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'social_media',
      details: {
        'screenTimeHours': screenTimeHours,
        'platform': platform,
        'factor': factor,
      },
    );
  }
}

class GamingCalculator implements CarbonCalculator {
  final double hoursPlayed;
  final String platform;

  GamingCalculator({
    required this.hoursPlayed,
    required this.platform,
  });

  @override
  CarbonCalculationResult calculate() {
    double factor = 0.2;
    if (platform.toLowerCase() == 'console') {
      factor = 0.3;
    }

    final kgCO2e = hoursPlayed * factor;

    return CarbonCalculationResult(
      kgCO2e: kgCO2e,
      timestamp: DateTime.now(),
      category: 'gaming',
      details: {
        'hoursPlayed': hoursPlayed,
        'platform': platform,
        'factor': factor,
      },
    );
  }
}
