import 'dart:async';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TextToSpeech extends StatefulWidget {
  @override
  TextToSpeechState createState() {
    return new TextToSpeechState();
  }
}

class TextToSpeechState extends State<TextToSpeech> {
  String result = "Coming Soon";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
           backgroundColor: Colors.yellow,
            iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
          title: Text(
            "Text To Speech",
            style: new TextStyle(color: Colors.black),
          ),
        ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
