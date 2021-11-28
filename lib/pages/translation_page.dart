import 'package:flutter/material.dart';
import 'text_translate.dart';

void main() {
  runApp(MaterialApp(
    home: TranslateApp(),
  ));
}

class TranslateApp extends StatefulWidget {
  @override
  _TranslateAppState createState() => _TranslateAppState();
}

class _TranslateAppState extends State<TranslateApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
