import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportService {
  Future<Uint8List> generateCarbonReport({
    required double totalCarbon,
    required List<Map<String, dynamic>> records,
    required String period,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Carbon Footprint Report',
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
pw.Text(
                  'Period: $period',
                  style: const pw.TextStyle(fontSize: 16),
                ),
                pw.SizedBox(height: 10),
                pw.Text('Total Carbon: ${totalCarbon.toStringAsFixed(2)} kg CO₂e',
                    style: const pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 30),
              pw.Text('Detailed Records', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('Date', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Type', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Value', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                  ...records.map((r) => pw.TableRow(
                    children: [
                      pw.Text(r['date'] as String),
                      pw.Text(r['type'] as String),
                      pw.Text('${r['value']} kg'),
                    ],
                  )),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> shareReport(Uint8List bytes) async {
    await Printing.sharePdf(bytes: bytes, filename: 'carbon_report.pdf');
  }
}