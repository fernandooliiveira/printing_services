import 'package:flutter/material.dart';
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
              final doc = pw.Document();
              doc.addPage(pw.Page(
                pageFormat: PdfPageFormat.undefined.applyMargin(left: 0, top: 0, right: 0, bottom: 0),
                build: (pw.Context context) {
                  return pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Título de teste',
                            style: pw.TextStyle(fontSize: 15),
                          ),
                          pw.Container(
                            height: 30,
                            width: 1,
                            color: PdfColors.black,
                          ),
                          pw.Text('Teste de conteúdo'),
                          pw.Text('Teste de conteúdo'),
                          pw.Text('Teste de conteúdo'),
                          pw.Text('Teste de conteúdo'),
                          pw.Text('Teste de conteúdo'),
                          pw.Container(
                            height: 30,
                            width: 1,
                            color: PdfColors.black,
                          ),
                        ],
                      )
                    ]
                  );
                },
              ));
              final pdfData = await doc.save();
              await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async => pdfData);
              // await Printing.directPrintPdf(
              //   printer: Printer(url: url),
              //   onLayout: (PdfPageFormat format) async => pdfData,
              // );
            },
          ),
        ),
      ),
    );
  }
}
