import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TextTranslate extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TextTranslate> {
  GoogleTranslator translator = GoogleTranslator();

  String text = "how are you";
  String _value ="af";

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
          backgroundColor: Colors.yellow,
          title: Text(
            "Language Translation",
            style: new TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.yellow,
        body: Center (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 320,
            width:380,
            color:Colors.transparent,
            child:Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,   
              children:[
                Container(
                  height:70,
                  child: DropdownButton(
                  menuMaxHeight: 250,                  
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
                ),   
                Container(
                height:242,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.transparent,
            ), 
                child: TextFormField(
                  maxLines: 9,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                )
              ]
              ),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
          Container(
            height: 320,
            width:380,
            color:Colors.transparent,
            child:Container(
              decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.all(
              Radius.circular(30),
              ),
            ),  
            )
          ),
        ],
        ),
        )
        );
  }
}
