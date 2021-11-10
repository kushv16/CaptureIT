import 'package:capture_it/pages/camera_page.dart';
import 'package:capture_it/pages/home_page.dart';
import 'package:capture_it/pages/barcode_page.dart';
import 'package:capture_it/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        CaptureITRoutes.defaultRoute: (context) => CameraPage(),
      },
    );
  }
}
