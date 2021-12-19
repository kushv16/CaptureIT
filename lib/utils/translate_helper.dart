import 'package:flutter/material.dart';
import '../pages/text_translation_screen.dart';

void main() {
  runApp(MaterialApp(
    home: TranslateApp(),
  ));
}

// helper function to the translate application in text translation
// and ocr translation
class TranslateApp extends StatefulWidget {
  @override
  _TranslateAppState createState() => _TranslateAppState();
}

class _TranslateAppState extends State<TranslateApp> {
  @override
  Widget build(BuildContext context) {
    return TextTranslate();
  }
}
