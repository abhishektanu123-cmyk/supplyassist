import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '../services/simulation_result_service.dart';

class QuickMitigationWidget extends StatefulWidget {
  const QuickMitigationWidget({super.key});

  static const String routeName = 'QuickMitigation';
  static const String routePath = '/quickMitigation';

  @override
  State<QuickMitigationWidget> createState() => _QuickMitigationWidgetState();
}

class _QuickMitigationWidgetState extends State<QuickMitigationWidget> {
  bool loading = true;
  Map<String, dynamic>? recommendedSupplier;
  String explanation = '';

  @override
  void initState() {
    super.initState();
    _loadAndDecide();
  }

  Future<void> _loadAndDecide() async {
    final simulation = context.read<SimulationResultService>();

    final snapshot =
    await FirebaseFirestore.instance.collection('suppliers').get();

    final affectedSupplierName = simulation.supplierName;
    final affectedCountry = simulation.country;

    double bestScore = -1;
    Map<String, dynamic>? bestSupplier;
    String bestExplanation = '';

    for (final doc in snapshot.docs) {
      final data = doc.data();

      // ❌ Skip affected supplier
      if (data['name'] == affectedSupplierName) continue;

      final int availability = data['availability'] ?? 0;
      final int riskScore = data['riskScore'] ?? 100;
      final String country = data['country'] ?? 'Unknown';

      final geoBonus = country != affectedCountry ? 10 : 0;

      final score =
          (availability * 0.5) + ((100 - riskScore) * 0.4) + geoBonus;

      if (score > bestScore) {
        bestScore = score;
        bestSupplier = data;
        bestExplanation =
        '''
• Availability: $availability%
• Risk Score: $riskScore%
• Country: $country
• Geographic diversification: ${geoBonus > 0 ? "Yes" : "No"}

This supplier minimizes disruption risk while maintaining supply continuity.
''';
      }
    }

    setState(() {
      recommendedSupplier = bestSupplier;
      explanation = bestExplanation;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final simulation = context.watch<SimulationResultService>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlutterFlowIconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Risk Mitigation Decision'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : recommendedSupplier == null
          ? const Center(child: Text('No backup supplier available'))
          : Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🚨 CONTEXT
            _sectionTitle('Disruption Context'),
            _infoCard(
              title: simulation.supplierName,
              subtitle:
              '${simulation.country} • Risk ${(simulation.riskAfter * 100).toStringAsFixed(0)}%',
              color: Colors.red,
            ),

            const SizedBox(height: 24),

            /// ✅ RECOMMENDATION
            _sectionTitle('Recommended Backup Supplier'),
            _infoCard(
              title: recommendedSupplier!['name'],
              subtitle:
              '${recommendedSupplier!['country']} • Availability ${recommendedSupplier!['availability']}%',
              color: Colors.green,
            ),

            const SizedBox(height: 24),

            /// 🧠 WHY
            _sectionTitle('Why this supplier?'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                explanation,
                style: const TextStyle(fontSize: 14),
              ),
            ),

            const Spacer(),

            /// ▶️ ACTION
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Backup supplier activated successfully'),
                    ),
                  );
                },
                child: const Text(
                  'Activate Backup Supplier',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 UI HELPERS

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.black54)),
        ],
      ),
    );
  }
}
