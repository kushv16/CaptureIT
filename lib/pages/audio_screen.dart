import 'package:flutter/material.dart';

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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Text To Speech",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          result,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
