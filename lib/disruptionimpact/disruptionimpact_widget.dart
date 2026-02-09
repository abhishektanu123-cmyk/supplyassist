import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supply_assist/services/disruption_pdf_service.dart';

import 'package:supply_assist/quick_mitigation/quick_mitigation_widget.dart';

import 'package:supply_assist/services/simulation_result_service.dart';

class DisruptionimpactWidget extends StatelessWidget {
  const DisruptionimpactWidget({super.key});

  static String routeName = 'Disruptionimpact';
  static String routePath = '/disruptionimpact';

  @override
  Widget build(BuildContext context) {
    final simulation = context.watch<SimulationResultService>();

    if (!simulation.hasData) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No simulation data available.\nRun a simulation first.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      /// 🔙 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: FlutterFlowIconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Disruption Impact Overview',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
            font: GoogleFonts.inter(fontWeight: FontWeight.w600),
            fontSize: 20,
          ),
        ),
      ),

      /// 🧠 BODY
      body: Column(
        children: [
          /// 🔥 TOP RISK SUMMARY
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: simulation.riskAfter > simulation.riskBefore
                    ? Colors.orange
                    : Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_rounded,
                      color: Colors.white, size: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${simulation.supplierName} • ${simulation.country}\n'
                          '${(simulation.riskAfter * 100).toStringAsFixed(0)}% SUPPLY RISK',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 📊 IMPACT CARDS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.78,
                ),
                children: [
                  _impactCard(
                    title: 'Time to Disruption',
                    description:
                    'Remaining buffer:\n'
                        '${(simulation.availabilityAfter / 4).toStringAsFixed(0)} hours\n\n'
                        'Production disruption expected if no action taken.',
                    status: simulation.availabilityAfter < 60
                        ? 'IMMINENT'
                        : 'STABLE',
                    color: simulation.availabilityAfter < 60
                        ? Colors.red
                        : Colors.green,
                  ),
                  _impactCard(
                    title: 'Primary Bottleneck',
                    description:
                    'SKU: ${simulation.sku}\n\n'
                        'Availability dropped from '
                        '${simulation.availabilityBefore.toStringAsFixed(0)}% '
                        'to ${simulation.availabilityAfter.toStringAsFixed(0)}%.',
                    status: simulation.riskAfter > 0.4
                        ? 'BOTTLENECK'
                        : 'SAFE',
                    color: simulation.riskAfter > 0.4
                        ? Colors.red
                        : Colors.green,
                  ),
                  _impactCard(
                    title: 'Geographic Risk',
                    description:
                    'Country: ${simulation.country}\n\n'
                        'Supplier concentration increases exposure to regional disruptions.',
                    status: 'CONCENTRATED',
                    color: Colors.orange,
                  ),
                  _impactCard(
                    title: 'Recommended Action',
                    description:
                    'Activate backup supplier.\n\n'
                        'Expected risk reduction:\n'
                        '${((simulation.riskBefore - simulation.riskAfter) * 100).abs().toStringAsFixed(0)}%',
                    status: 'ACTION REQUIRED',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),

          /// ⚙️ ACTION BAR
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  color: Color(0x1A000000),
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    _actionButton(context, 'EXPEDITE', Colors.orange),
                    const SizedBox(width: 8),
                    _actionButton(
                        context, 'BACKUP SUPPLIER', Colors.blue),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _actionButton(
                        context, 'NOTIFY CUSTOMER', Colors.green),
                    const SizedBox(width: 8),
                    _actionButton(
                        context, 'PDF REPORT', const Color(0xFF757575)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 IMPACT CARD
  static Widget _impactCard({
    required String title,
    required String description,
    required String status,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 16,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description,
              style: const TextStyle(fontSize: 12, height: 1.4)),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 ACTION BUTTON
  static Widget _actionButton(
      BuildContext context,
      String text,
      Color color,
      ) {
    return Expanded(
      child: FFButtonWidget(
        onPressed: () {
          // 🔥 PDF REPORT
          if (text == 'PDF REPORT') {
            final simulation =
            context.read<SimulationResultService>();
            DisruptionPdfService.generate(simulation);
          }

          // 🚀 EXPEDITE → Quick Mitigation
          else if (text == 'EXPEDITE') {
            context.pushNamed(
              QuickMitigationWidget.routeName,
            );
          }

          // 🧠 BACKUP SUPPLIER (future logic)
          else if (text == 'BACKUP SUPPLIER') {
            context.pushNamed(
              QuickMitigationWidget.routeName,
            );
          }

          // 📢 NOTIFY CUSTOMER (placeholder)
          else if (text == 'NOTIFY CUSTOMER') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Customer notification triggered'),
              ),
            );
          }
        },
        text: text,
        options: FFButtonOptions(
          height: 48,
          color: color,
          maxLines: 2,
          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
            color: Colors.white,
            fontSize: 11,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

}
