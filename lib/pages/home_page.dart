import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleTranslator translator = GoogleTranslator();

  String text = "Hello how are you bitch?";

  void translate() {
    translator.translate(text, to: "hi").then((output) {
      setState(() {
        text = output as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Language Translation"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(text),
                RaisedButton(
                    onPressed: () {
                      translate();
                    },
                    child: Text("Translate this text"))
              ]),
        ));
  }
}
