class IntensityRule {
  final int riskDelta;
  final int availabilityDelta;

  const IntensityRule({
    required this.riskDelta,
    required this.availabilityDelta,
  });
}

const intensityRules = {
  'Low': IntensityRule(
    riskDelta: 5,
    availabilityDelta: -5,
  ),
  'Medium': IntensityRule(
    riskDelta: 12,
    availabilityDelta: -12,
  ),
  'High': IntensityRule(
    riskDelta: 25,
    availabilityDelta: -25,
  ),
};
