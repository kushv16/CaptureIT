import 'dart:async';
import 'package:capture_it/pages/audio_screen.dart';
import 'package:capture_it/pages/ocr_screen.dart';
import 'package:capture_it/pages/text_translation_screen.dart';
import 'package:capture_it/pages/barcode_screen.dart';
import 'package:capture_it/utils/routes.dart';
import 'package:capture_it/pages/image_with_translation_screen.dart';
import 'package:capture_it/pages/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// main file
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // linking all the routes
      routes: {
        CaptureITRoutes.defaultRoute: (context) => MyHomePage(),
        CaptureITRoutes.homeRoute: (context) => HomePage(),
        CaptureITRoutes.barcodeRoute: (context) => BarcodePage(),
        CaptureITRoutes.ocrRoute: (context) => CameraPage(),
        CaptureITRoutes.imageTranslateRoute: (context) => ImageTranslate(),
        CaptureITRoutes.translateRoute: (context) => TextTranslate(),
        CaptureITRoutes.textToSpeechRoute: (context) => TextToSpeech(),
        CaptureITRoutes.mapRoute: (context) => Map(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // timer function used to redirect to the homepage after 3 seconds
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  // splash screen
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: new Image.asset('assets/logo.png'),
      alignment: Alignment.center,
    );
  }
}

// home screen ui buttons and app bar
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            "Capture IT",
            style: new TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CaptureITRoutes.barcodeRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/barcode.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CaptureITRoutes.ocrRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/ocr.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CaptureITRoutes.translateRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/text.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CaptureITRoutes.imageTranslateRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/image_to_text.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CaptureITRoutes.textToSpeechRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/mic.png'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CaptureITRoutes.mapRoute);
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: new Image.asset('assets/map.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
