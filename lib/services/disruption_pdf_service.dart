import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'simulation_result_service.dart';

class DisruptionPdfService {
  static Future<void> generate(
      SimulationResultService simulation,
      ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Padding(
          padding: const pw.EdgeInsets.all(24),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Disruption Impact Report',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),

              _row('Supplier', simulation.supplierName),
              _row('Country', simulation.country),
              _row('SKU', simulation.sku),

              pw.Divider(),

              _row(
                'Availability (Before)',
                '${simulation.availabilityBefore.toStringAsFixed(0)}%',
              ),
              _row(
                'Availability (After)',
                '${simulation.availabilityAfter.toStringAsFixed(0)}%',
              ),

              pw.Divider(),

              _row(
                'Risk Before',
                '${(simulation.riskBefore * 100).toStringAsFixed(0)}%',
              ),
              _row(
                'Risk After',
                '${(simulation.riskAfter * 100).toStringAsFixed(0)}%',
              ),

              pw.SizedBox(height: 20),
              pw.Text(
                'Recommended Action:',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Activate backup supplier and expedite logistics.',
              ),
            ],
          ),
        ),
      ),
    );

    // 🔥 THIS OPENS SHARE / PREVIEW
    await Printing.layoutPdf(
      onLayout: (_) => pdf.save(),
      name: 'Disruption_Impact_Report.pdf',
    );
  }

  static pw.Widget _row(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label),
          pw.Text(
            value,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
