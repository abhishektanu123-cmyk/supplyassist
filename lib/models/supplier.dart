class Supplier {
  final String id;
  final String name;
  final String country;
  final String sku;
  final int riskScore;
  final int availability;

  Supplier({
    required this.id,
    required this.name,
    required this.country,
    required this.sku,
    required this.riskScore,
    required this.availability,
  });

  factory Supplier.fromFirestore(String id, Map<String, dynamic> data) {
    return Supplier(
      id: id,
      name: data['name'] ?? 'Unknown Supplier',
      country: data['country'] ?? 'Unknown',
      sku: data['sku'] ?? 'N/A', // ✅ VERY IMPORTANT
      riskScore: (data['riskScore'] ?? 0) as int,
      availability: (data['availability'] ?? 0) as int,
    );
  }
}
