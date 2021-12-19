import 'dart:async';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodePage extends StatefulWidget {
  @override
  BarcodePageState createState() {
    return new BarcodePageState();
  }
}

class BarcodePageState extends State<BarcodePage> {
  // stores the result upon scanning
  String result = "Start Scanning!";

  // initiates the scan() object which makes use of the camera
  // launches the url using launch() method from url_launch
  Future _scanQR() async {
    try {
      ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      if (await canLaunch(qrResult)) {
        try {
          // initiate the website view
          await launch(qrResult, forceWebView: true);
        } on PlatformException {
          throw ' : This app does not support payment QR codes.';
        }
      } else {
        // storing output in result variable
        setState(() {
          result = qrResult;
        });
      }
    } on PlatformException catch (e) {
      // incase the user denies the camera permission
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera Permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $e";
        });
      }
    } on FormatException {
      // in case the user doesnt click any photo and presses the back button
      setState(() {
        result = "You have pressed the back button before scanning anything";
      });
    } catch (e) {
      setState(() {
        result = "Unknown Error $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "QR Scanner",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          result,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        icon: const Icon(Icons.camera_alt, color: Colors.black),
        label: const Text("Scan", style: TextStyle(color: Colors.black)),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
