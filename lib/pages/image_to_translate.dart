import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'details.dart';
import 'package:translator/translator.dart';

class ImageTranslate extends StatefulWidget {
  const ImageTranslate({Key? key}) : super(key: key);

  @override
  State<ImageTranslate> createState() => _ImageTranslateState();
}

class _ImageTranslateState extends State<ImageTranslate> {
  String _text = '';
  String _value = 'af';
  String _output = "";
  var _image = null;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Recognition'),
        actions: [
          DropdownButton(
            value: _value,
            items: [
              DropdownMenuItem(child: Text("Afrikaans"), value: "af"),
              DropdownMenuItem(child: Text("Albanian"), value: "sq"),
              DropdownMenuItem(child: Text("Amharic"), value: "am"),
              DropdownMenuItem(child: Text("Arabic"), value: "ar"),
              DropdownMenuItem(child: Text("Armenian"), value: "hy"),
              DropdownMenuItem(child: Text("Azerbaijani"), value: "az"),
              DropdownMenuItem(child: Text("Basque"), value: "eu"),
              DropdownMenuItem(child: Text("Belarusian"), value: "be"),
              DropdownMenuItem(child: Text("Bengali"), value: "bn"),
              DropdownMenuItem(child: Text("Bosnian"), value: "bs"),
              DropdownMenuItem(child: Text("Bulgarian"), value: "bg"),
              DropdownMenuItem(child: Text("Catalan"), value: "ca"),
              DropdownMenuItem(child: Text("Marathi"), value: "mr"),
            ],
            hint: Text(
              "Select item",
              style: TextStyle(color: Colors.white),
            ),
            onChanged: (String? newValue) {
              setState(() {
                _value = newValue!;
              });
            },
          ),
          FlatButton(
            onPressed: scanText,
            child: Text(
              'Scan',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: _image != null
            ? Image.file(
                File(_image.path),
                fit: BoxFit.fitWidth,
              )
            : Container(),
      ),
    );
  }

  Future scanText() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => Center(
              child: CircularProgressIndicator(),
            ));
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    _text = '';
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        _text += line.text + " ";
      }
    }
    await translateText(_text, _value);
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_output)));
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }

  Future translateText(String text, String value) async {
    if (text == "") {
      _output = "No Text Detected!";
    } else {
      final translated_text = await translate(text, value);
      setState(() {
        _output = translated_text;
      });
    }
  }

  Future<String> translate(String text, String value) async {
    GoogleTranslator translator = GoogleTranslator();
    var result = await translator.translate(text, to: value);
    return result.text;
  }
}
