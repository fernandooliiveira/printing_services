// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_libserialport/flutter_libserialport.dart';
// import 'package:impressora/main_usb_printer.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ESC/POS Printer Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var availablePorts = [];
//   var port = SerialPort('COM3');
//
//   @override
//   void initState() {
//     super.initState();
//     initPorts();
//   }
//
//   void initPorts() {
//     setState(() => availablePorts = SerialPort.availablePorts);
//   }
//
//   Future<void> _printText(BuildContext context) async {
//     const String serialPort =
//         'COM3'; // Substitua pela porta serial da sua impressora USB
//     var availablePorts = SerialPort.availablePorts;
//
//     print(availablePorts);
//     // var printer = UsbPrinter();
//     // var netPrinter = NetworkPrinter(_paperSize, _profile)
//     // final PosPrintResult res = await Printer.connectSerial(serialPort).then((printer) {
//     //   printer.text('Exemplo de texto para impressão ESC/POS',
//     //       styles: PosStyles(
//     //         align: PosAlign.left,
//     //         bold: true,
//     //         underline: true,
//     //         reverse: true,
//     //         height: PosTextSize.size2,
//     //         width: PosTextSize.size2,
//     //       ),
//     //       linesAfter: 5);
//     //   printer.cut();
//     //   return printer.disconnect();
//     // });
//     //
//     // if (res != PosPrintResult.success && mounted) {
//     //   showDialog(
//     //     context: context,
//     //     builder: (BuildContext context) {
//     //       return AlertDialog(
//     //         title: Text('Erro ao imprimir'),
//     //         content: Text('Ocorreu um erro ao imprimir o texto. Por favor, tente novamente.'),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             child: Text('Fechar'),
//     //             onPressed: () {
//     //               Navigator.of(context).pop();
//     //             },
//     //           ),
//     //         ],
//     //       );
//     //     },
//     //   );
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ESC/POS Printer Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 port.open(mode: SerialPortMode.read);
//                 // NetworkPrinter
//                 // x.port.read(200);
//                 print(port.address);
//                 print(port.busNumber);
//                 print(port.name);
//                 print(port.macAddress);
//                 print(port.vendorId);
//                 print(port.isOpen);
//                 print(port.productId);
//               },
//               child: Text('Imprimir Texto'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
