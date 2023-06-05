// import 'dart:typed_data';
//
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:flutter_usb_printer/flutter_usb_printer.dart';
// import 'package:usb_serial/transaction.dart';
// import 'package:usb_serial/usb_serial.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Impressora USB')),
//         body: Center(child: PrintButton()),
//       ),
//     );
//   }
// }
//
// class PrintButton extends StatefulWidget {
//   @override
//   _PrintButtonState createState() => _PrintButtonState();
// }
//
// class _PrintButtonState extends State<PrintButton> {
//   bool _printing = false;
//
//   void _printText() async {
//     setState(() {
//       _printing = true;
//     });
//
//     UsbDevice dev = await UsbPort(methodChannelName)
//
//
//     UsbDevice? device = await UsbSerial.discover().firstWhere(
//             (device) => device.vid == 0x1a86 && device.pid == 0x7523,
//         orElse: () => null);
//
//     if (device == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Nenhuma impressora USB encontrada.')));
//       setState(() {
//         _printing = false;
//       });
//       return;
//     }
//
//     UsbPort? port = await device.create();
//     if (!await port!.open()) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Falha ao abrir a porta USB.')));
//       setState(() {
//         _printing = false;
//       });
//       return;
//     }
//
//     port.setDTR(true);
//     port.setRTS(true);
//
//     Transaction<String> transaction = Transaction.stringTerminated(
//         port.inputStream!, Uint8List.fromList([0x0a, 0x0d]));
//
//     PrinterNetworkManager printerManager = PrinterNetworkManager();
//     printerManager.selectPrinter(port);
//
//     final PosPrintResult res = await printerManager.printTicket(await _demoTicket());
//
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Resultado da impressão: ${res.msg}')));
//
//     port.close();
//     setState(() {
//       _printing = false;
//     });
//   }
//
//   Future<FlutterUsbPrinter> _demoTicket() async {
//     final FlutterUsbPrinter printer = FlutterUsbPrinter();
//     printer.
//     final Ticket ticket = PaperSize(PaperSize.mm80);
//
//     ticket.text('Olá, impressora USB!');
//     ticket.feed(2);
//     ticket.cut();
//
//     return ticket;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: _printing ? null : _printText,
//       child: Text(_printing ? 'Imprimindo...' : 'Imprimir Texto'),
//     );
//   }
// }
