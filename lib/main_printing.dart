import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:printer_service/printer_service_init.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Imprimir diretamente')),
        body: Center(
          child: ElevatedButton(
            child: Text('Imprimir'),
            onPressed: () async {
              // final printerService = PrinterService();
              // await printerService.printPull(model: null);

              final doc = pw.Document();
              doc.addPage(
                pw.Page(
                  margin: const pw.EdgeInsets.symmetric(horizontal: 2),
                  // pageFormat: ElginPageFormat.elgin,
                  pageFormat: PdfPageFormat.roll80,
                  build: (pw.Context context) {
                    return pw.Column(
                      children: [
                        pw.Text(
                          "DROGARIA - 1",
                          style: const pw.TextStyle(
                            decorationStyle: pw.TextDecorationStyle.solid,
                            fontSize: 12,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "AV. SEGUNDA AVENIDA QUADRA 1B LOTE 59 AAAAAAAAAAAAA AAAA CIDADE VERA CRUZ GOIANIA-GO",
                          textAlign: pw.TextAlign.center,
                          style: const pw.TextStyle(
                            fontSize: 7,
                          ),
                        ),
                        pw.Text(
                          "CEP: 74.934-605",
                          style: const pw.TextStyle(
                            fontSize: 7,
                          ),
                        ),
                        pw.Text(
                          "TELEFONE: (62) 1234-1234/(62) 1234-1234",
                          style: const pw.TextStyle(
                            fontSize: 7,
                          ),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "CNPJ: 88.888.888/0001-91 IE: 000000000",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.Text(
                              "IM: 10050",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  DateFormat('dd/MM/yyyy HH:mm:ss')
                                      .format(DateTime.now()),
                                  style: const pw.TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                pw.SizedBox(width: 15),
                                pw.Text(
                                  "NR: 000000043",
                                  style: const pw.TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 8),
                            pw.Container(
                                width: double.infinity,
                                height: 1,
                                color: PdfColors.black),
                            pw.SizedBox(height: 2),
                            pw.Text(
                              "COMPROVANTE NAO FISCAL",
                              style: const pw.TextStyle(
                                decorationStyle: pw.TextDecorationStyle.solid,
                                fontSize: 10,
                              ),
                            ),
                            pw.Text(
                              "Nr. Cupom: 000043",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.Text(
                              "Operador: QATESTE120",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.SizedBox(height: 8),
                            pw.Row(
                              children: List.generate(
                                400 ~/ 5,
                                (index) => pw.Expanded(
                                  child: pw.Container(
                                    color: index % 2 == 0
                                        ? PdfColors.black
                                        : PdfColors.white,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                            pw.SizedBox(height: 8),
                            pw.Text(
                              "Motivo: PAGAMENTO FERIADO",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.Text(
                              "Observações: A175 A 32",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                            pw.SizedBox(height: 15),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              children: [
                                pw.Text(
                                  "Ass: ",
                                  style: const pw.TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                pw.SizedBox(width: 5),
                                pw.Expanded(
                                  child: pw.Container(
                                    width: 200,
                                    height: 1,
                                    color: PdfColors.black,
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 10),
                            pw.Container(
                              width: double.infinity,
                              height: 1,
                              color: PdfColors.black,
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              "Caixa: 010 Loja: 001 Impresso em: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())}",
                              style: const pw.TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 50),
                        pw.Container(
                          width: double.infinity,
                          height: 1,
                          color: PdfColors.black,
                        ),
                      ],
                    );
                  },
                ),
              );
              final pdfData = doc.save();

              Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) => pdfData,
                  format: PdfPageFormat.roll80,
                  usePrinterSettings: true);
            },
          ),
        ),
      ),
    );
  }
}

class ElginPageFormat extends PdfPageFormat {
  const ElginPageFormat(super.width, super.height)
      : super(marginBottom: 5 * mm, marginLeft: 5 * mm, marginRight: 5 * mm);

  static const double point = 1.0;
  static const double inch = 72.0;
  static const double cm = inch / 2.54;
  static const double mm = inch / 25.4;

  static const ElginPageFormat elgin =
      ElginPageFormat(80 * mm, double.infinity);
}

class CustomPdfColors extends PdfColor {
  CustomPdfColors(super.red, super.green, super.blue);
}
