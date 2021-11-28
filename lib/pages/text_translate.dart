import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleTranslator translator = GoogleTranslator();

  String text = "how are you";

  void translate() {
    translator.translate(text, to: "mr").then((output) {
      setState(() {
        text = output.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Language Translation",
            style: new TextStyle(color: Colors.red),
          ),
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
