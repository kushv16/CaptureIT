import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  @override
  MapState createState() {
    return new MapState();
  }
}

class MapState extends State<Map> {
  String result = "Coming Soon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "Maps",
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
