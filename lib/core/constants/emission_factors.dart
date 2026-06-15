class EmissionFactors {
  /// Global average carbon intensity of electricity (kg CO2e / kWh)
  /// Source: IEA (International Energy Agency) 2023 estimate approx 438g/kWh.
  static const double electricityGlobalAverage = 0.438;

  /// Data Transfer Carbon Intensity (kg CO2e / GB)
  /// Source: The Shift Project / IEA "The footprint of streaming video" (updated models)
  /// Mobile networks (4G/5G) are significantly more energy-intensive than fixed-line.
  static const double dataTransferMobile = 0.11; // 110g per GB
  static const double dataTransferWifi = 0.012;  // 12g per GB (Fixed-line/Fiber)

  /// Streaming Emissions (kg CO2e / hour)
  /// Derived from data transfer + device energy for a typical smartphone.
  /// Source: IEA "The carbon footprint of streaming video" (2020)
  static const double streaming4K = 0.44;     // ~7GB/hr + device
  static const double streamingFullHD = 0.12; // ~3GB/hr + device
  static const double streamingHD = 0.06;     // ~1.5GB/hr + device
  static const double streamingSD = 0.02;     // ~0.7GB/hr + device

  /// Email Emissions (kg CO2e)
  /// Source: "How Bad Are Bananas?" by Mike Berners-Lee
  static const double emailSpam = 0.0003;       // 0.3g
  static const double emailStandard = 0.004;    // 4g
  static const double emailWithAttachment = 0.050; // 50g (depends on size)

  /// AI Operations (kg CO2e / query)
  /// Source: Estimates for GPT-3 class models (varies by model size and data center efficiency)
  /// Research from Luccioni et al. (2023) suggests ~0.001 - 0.006 kg per 1000 tokens.
  static const double aiPromptAverage = 0.0015; // 1.5g per prompt/completion

  /// Search Engine (kg CO2e / search)
  /// Source: Google Environmental Report
  static const double searchGoogle = 0.0002; // 0.2g

  /// Embodied Carbon (Manufacturing/Transport/End-of-life)
  /// Source: Apple/Samsung Environmental Reports
  static const double smartphoneEmbodied = 60.0;  // ~60kg CO2e per device
  static const double laptopEmbodied = 300.0;     // ~300kg CO2e per device
  static const double tabletEmbodied = 150.0;     // ~150kg CO2e per device
}
