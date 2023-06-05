// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
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
//   UsbPort? _port;
//   String _status = "Searching for USB device...";
//   StreamSubscription? _subscription;
//   Transaction<String>? _transaction;
//
//   @override
//   void initState() {
//     super.initState();
//     UsbSerial.listDevices().then((devices) {
//       devices.forEach((device) {
//         setState(() {
//           _status += '\n- ${device.productName}';
//         });
//       });
//
//       if (devices.isEmpty) {
//         setState(() {
//           _status = "No USB device found";
//         });
//       } else {
//         _connect(devices.first);
//       }
//     });
//   }
//
//   void _connect(UsbDevice device) async {
//     _port = await device.create();
//     if (!await _port!.open()) {
//       setState(() {
//         _status = "Failed to open USB port";
//       });
//       return;
//     }
//
//     _transaction = Transaction.stringTerminated(_port!.inputStream!, Uint8List.fromList([13, 10]));
//
//     _subscription = _transaction!.stream.listen((String line) {
//       setState(() {
//         _status = "Received: $line";
//       });
//     });
//
//     setState(() {
//       _status = "Connected to ${device.productName}";
//     });
//   }
//
//   void _sendDataToPrinter() async {
//     if (_port == null) {
//       return;
//     }
//
//     String data = "Hello, USB Printer!\n";
//     await _port!.write(Uint8List.fromList(data.codeUnits));
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     _port?.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(_status),
//         ElevatedButton(
//           onPressed: _sendDataToPrinter,
//           child: Text('Send Data to Printer'),
//         ),
//       ],
//     );
//   }
// }
