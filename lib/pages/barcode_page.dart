// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(
//       const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BarCodePage(),
//       ),
//     );

// class _BarCodePageState extends StatefulWidget {
//   @override
//   _BarCodeState createState() {
//     return new _BarCodePageState();
//   }
// }

// class _BarCodeState {}

// class _BarCodePageState extends State<BarCodePage> {
//   String result = "Hey there!";
//   Future _scanQR() async {
//     try {
//       String qrResult = await BarcodeScanner.scan();
//       setState(() {
//         result = qrResult;
//       });
//     } on PlatformException catch (e) {
//       if (ex.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           result = "Camera Permission was denied";
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Scanner"),
//       ),
//       body: Center(
//         child: Text(
//           result,
//           style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         icon: Icon(Icons.camera_alt),
//         label: Text("Scan"),
//         onPressed: _scanQR,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
