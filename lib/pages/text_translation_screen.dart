import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import '../utils/dropdownBelowTest.dart';

class TextTranslate extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TextTranslate> {
  GoogleTranslator translator = GoogleTranslator();

  String text = "";
  String translatedText = "";
  String _value = "en";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> _dropdownTestItems = [
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
    ];

    onChangeDropdownTests(selectedTest) {
      setState(() {
        _value = selectedTest;
      });
      translator.translate(text, to: _value).then((output) {
        setState(() {
          translatedText = output.text;
        });
      });
    }

    onChangeTextField(englishText) {
      text = englishText;
      translator.translate(text, to: _value).then((output) {
        setState(() {
          translatedText = output.text;
        });
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
                      iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
          title: Text(
            "Language Translation",
            style: new TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.yellow,
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 380,
                color: Colors.transparent,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 242,
                          child: TextFormField(
                            cursorHeight: 30,
                            initialValue: text,
                            maxLines: 16,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onChanged: onChangeTextField,
                          ),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              ),
              Container(
                width: 380,
                color: Colors.transparent,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          child: DropdownBelow(
                            itemWidth: 200,
                            itemTextstyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            boxTextstyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                            boxWidth: 380,
                            boxHeight: 70,
                            boxDecoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                width: 3,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.black,
                            ),
                            hint: Text('Choose Language'),
                            value: _value,
                            items: _dropdownTestItems,
                            onChanged: onChangeDropdownTests,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            key: translatedText.isNotEmpty ? Key(translatedText) : Key(""),
                            initialValue: translatedText,
                            cursorHeight: 30,
                            maxLines: 12,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        )));
  }
}
