// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:libserialport/libserialport.dart';
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
//         appBar: AppBar(title: Text('USB Printer Example')),
//         body: Center(child: UsbPrinter()),
//       ),
//     );
//   }
// }
//
// class UsbPrinter extends StatefulWidget {
//   @override
//   _UsbPrinterState createState() => _UsbPrinterState();
// }
//
// class _UsbPrinterState extends State<UsbPrinter> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     final name = SerialPort.availablePorts.first;
//     final port = SerialPort(name);
//     if (!port.openReadWrite()) {
//       print(SerialPort.lastError);
//       // exit(-1);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Ta osso"),
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('Send Data to Printer'),
//         ),
//       ],
//     );
//   }
// }
