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

  /// Search Engine (kg CO2e / search)
  /// Source: Google Environmental Report
  static const double searchGoogle = 0.0002; // 0.2g
  static const double searchAI = 0.004;      // 4g (Generative AI search is ~20x traditional)

  /// AI Usage (kg CO2e / prompt)
  /// Source: Various studies on LLM energy consumption (e.g., Luccioni et al. 2023)
  static const double aiPromptAverage = 0.002; // 2g per prompt
  static const double aiImageGeneration = 0.01; // 10g per image

  /// E-commerce & Logistics (kg CO2e / order)
  /// Average last-mile delivery and packaging
  static const double ecommerceOrder = 0.5;

  /// Cryptocurrency (kg CO2e / transaction)
  /// Note: Highly variable based on network (Proof of Work vs Proof of Stake)
  static const double cryptoBitcoin = 400.0; // High estimate for BTC
  static const double cryptoEthereum = 0.01; // Post-Merge estimate

  /// Embodied Carbon (Manufacturing/Transport/End-of-life)
  /// Source: Apple/Samsung Environmental Reports
  static const double smartphoneEmbodied = 60.0;  // ~60kg CO2e per device
  static const double laptopEmbodied = 300.0;     // ~300kg CO2e per device
  static const double tabletEmbodied = 150.0;     // ~150kg CO2e per device
}
