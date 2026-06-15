import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';
import 'package:intl/intl.dart';

class PdfReportService {
  static Future<void> generateAndPrintReport(List<AnalyticsData> data, String title) async {
    final pdf = pw.Document();

    final totalCarbon = data.fold(0.0, (sum, item) => sum + item.carbonValue);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('EcoDcf Sustainability Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  pw.Text(DateFormat('yyyy-MM-dd').format(DateTime.now())),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Report Type: $title', style: const pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 10),
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(5)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Summary Statistics', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 5),
                  pw.Text('Total Carbon Footprint: ${totalCarbon.toStringAsFixed(2)} kg CO2e'),
                  pw.Text('Data Points: ${data.length}'),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            _buildCategorySummary(data),
            pw.SizedBox(height: 20),
            pw.Text('Detailed History', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.TableHelper.fromTextArray(
              headers: ['Date', 'Category', 'Carbon (kg CO2e)'],
              data: data.map((item) => [
                DateFormat('yyyy-MM-dd').format(item.date),
                item.category,
                item.carbonValue.toStringAsFixed(2),
              ]).toList(),
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'EcoDcf_Report_${DateFormat('yyyyMMdd').format(DateTime.now())}.pdf',
    );
  }

  static pw.Widget _buildCategorySummary(List<AnalyticsData> data) {
    final Map<String, double> categories = {};
    for (var item in data) {
      categories[item.category] = (categories[item.category] ?? 0) + item.carbonValue;
    }

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Category Breakdown', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 10),
        pw.TableHelper.fromTextArray(
          headers: ['Category', 'Carbon (kg CO2e)', '% of Total'],
          data: categories.entries.map((e) {
            final total = categories.values.fold(0.0, (a, b) => a + b);
            final percent = (e.value / total * 100).toStringAsFixed(1);
            return [e.key, e.value.toStringAsFixed(2), '$percent%'];
          }).toList(),
        ),
      ],
    );
  }
}

