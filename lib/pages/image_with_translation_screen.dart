import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/details.dart';
import 'package:translator/translator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class ImageTranslate extends StatefulWidget {
  const ImageTranslate({Key? key}) : super(key: key);

  @override
  State<ImageTranslate> createState() => _ImageTranslateState();
}

class _ImageTranslateState extends State<ImageTranslate> {
  // stores user entered text
  String _text = '';
  // stores user selected output language
  String _value = 'af';
  // stores the translated output
  String _output = "";
  // stroes the image clicked by the user
  var _image = null;

  // ImagePicker object created that stores the image
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "OCR",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          DropdownButton(
            value: _value,
            // list of items in drop down button
            items: const [
              DropdownMenuItem(child: Text("English"), value: "en"),
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
              DropdownMenuItem(child: Text("Catalan"), value: "cat"),
              DropdownMenuItem(child: Text("Marathi"), value: "mr"),
            ],
            hint: const Text(
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
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Scan',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
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

  // scans the input image and extracts the text
  Future scanText() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => const Center(
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
    // making use of await to convert Future<String> to String
    await translateText(_text, _value);
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_output)));
  }

  // uses the imagepicker object to get an image
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

  // returns translated output
  Future translateText(String text, String value) async {
    if (text == "") {
      _output = "No Text Detected!";
    } else {
      // using setState to store the output
      final translated_text = await translate(text, value);
      setState(() {
        _output = translated_text;
      });
    }
  }

  // initiates the GoogleTranslator object that translates the text
  Future<String> translate(String text, String value) async {
    GoogleTranslator translator = GoogleTranslator();
    var result = await translator.translate(text, to: value);
    return result.text; // return Future<String>
  }
}
