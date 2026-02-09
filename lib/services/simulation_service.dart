import '../models/supplier.dart';

class SimulationService {
  static Supplier applyIntensity(
      Supplier supplier,
      String intensity,
      ) {
    int riskDelta = 0;
    double availabilityDelta = 0;

    switch (intensity.toLowerCase()) {
      case 'high':
        riskDelta = 20;
        availabilityDelta = -15;
        break;
      case 'medium':
        riskDelta = 10;
        availabilityDelta = -8;
        break;
      case 'low':
        riskDelta = -10;
        availabilityDelta = 5;
        break;
    }

    final int newRiskScore =
    (supplier.riskScore + riskDelta).clamp(0, 100);

    final double newAvailability =
    (supplier.availability + availabilityDelta)
        .clamp(0, 100)
        .toDouble(); // ✅ FIX

    final String newRiskLevel = newRiskScore >= 70
        ? 'high'
        : newRiskScore >= 40
        ? 'medium'
        : 'low';

    return supplier.copyWith(
      riskScore: newRiskScore,
      availability: newAvailability,
      riskLevel: newRiskLevel,
    );
  }
}
