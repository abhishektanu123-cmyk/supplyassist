class SimulationResult {
  final String supplierName;
  final String sku;
  final String location;
  final double availability;
  final double riskBefore;
  final double riskAfter;

  SimulationResult({
    required this.supplierName,
    required this.sku,
    required this.location,
    required this.availability,
    required this.riskBefore,
    required this.riskAfter,
  });
}
