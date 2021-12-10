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
  String result = "Start Scanning!";
  Future _scanQR() async {
    try {
      ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      if (await canLaunch(qrResult)) {
        try {
          await launch(qrResult, forceWebView: true);
        } on PlatformException {
          throw ' : This app does not support payment QR codes.';
        }
      } else {
        setState(() {
          result = qrResult;
        });
      }
    } on PlatformException catch (e) {
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
            iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
          title: Text(
            "QR Scanner",
            style: new TextStyle(color: Colors.black),
          ),
        ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        icon: Icon(Icons.camera_alt, color:Colors.black),
        label: Text("Scan", style: TextStyle(color: Colors.black)),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}