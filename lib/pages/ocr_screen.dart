import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/details.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // stores user entered text
  String _text = '';
  // stroes the image clicked by the user
  var _image = null;
  // ImagePicker object created that stores the image
  late Future<File> imageFile;
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
            FlatButton(
              onPressed: scanText,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 2),
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
        ));
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
        _text += line.text + '\n';
      }
    }
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_text)));
  }

  // uses the imagepicker object to get an image
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      }
    });
  }
}
