import 'package:flutter/material.dart';

class SimulationResultService extends ChangeNotifier {
  bool hasData = false;

  String supplierName = '';
  String sku = '';
  String country = '';

  double availabilityBefore = 0;
  double availabilityAfter = 0;

  double riskBefore = 0;
  double riskAfter = 0;

  void runSimulation({
    required String supplierName,
    required String sku,
    required String country,
    required double baseAvailability,
    required String intensity,
  }) {
    this.supplierName = supplierName;
    this.sku = sku;
    this.country = country;

    availabilityBefore = baseAvailability * 100;

    final intensityFactor = switch (intensity) {
      'High' => 0.6,
      'Medium' => 0.8,
      'Low' => 0.95,
      _ => 1.0,
    };

    availabilityAfter =
        (availabilityBefore * intensityFactor).clamp(0, 100);

    riskBefore = 1 - (availabilityBefore / 100);
    riskAfter = 1 - (availabilityAfter / 100);

    hasData = true;
    notifyListeners();
  }
}
