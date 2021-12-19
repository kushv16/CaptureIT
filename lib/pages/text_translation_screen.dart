import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import '../utils/dropdownBelowTest.dart';

class TextTranslate extends StatefulWidget {
  const TextTranslate({Key? key}) : super(key: key);
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
    // list of items in drop down button
    List<DropdownMenuItem> _dropdownTestItems = [
      const DropdownMenuItem(child: Text("English"), value: "en"),
      const DropdownMenuItem(child: Text("Afrikaans"), value: "af"),
      const DropdownMenuItem(child: Text("Albanian"), value: "sq"),
      const DropdownMenuItem(child: Text("Amharic"), value: "am"),
      const DropdownMenuItem(child: Text("Arabic"), value: "ar"),
      const DropdownMenuItem(child: Text("Armenian"), value: "hy"),
      const DropdownMenuItem(child: Text("Azerbaijani"), value: "az"),
      const DropdownMenuItem(child: Text("Basque"), value: "eu"),
      const DropdownMenuItem(child: Text("Belarusian"), value: "be"),
      const DropdownMenuItem(child: Text("Bengali"), value: "bn"),
      const DropdownMenuItem(child: Text("Bosnian"), value: "bs"),
      const DropdownMenuItem(child: Text("Bulgarian"), value: "bg"),
      const DropdownMenuItem(child: Text("Catalan"), value: "cat"),
      const DropdownMenuItem(child: Text("Marathi"), value: "mr"),
    ];

    // change the dropdown item on change
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

    // update user text on change and translate in real time
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
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            "Language Translation",
            style: TextStyle(color: Colors.black),
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
              const Padding(
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
                            itemTextstyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            boxTextstyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            boxPadding:
                                const EdgeInsets.fromLTRB(13, 12, 13, 12),
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
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: Colors.black,
                            ),
                            hint: const Text('Choose Language'),
                            value: _value,
                            items: _dropdownTestItems,
                            onChanged: onChangeDropdownTests,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            key: translatedText.isNotEmpty
                                ? Key(translatedText)
                                : Key(""),
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
