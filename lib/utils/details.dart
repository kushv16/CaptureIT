import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String text;
  // accepts and stores the text that needs to be printed
  // ignore: use_key_in_widget_constructors
  const Details(this.text);
  @override
  _DetailsState createState() => _DetailsState();
}

// used to display the output of ocr and ocr translate pages
class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.copy,
              color: Colors.black,
            ),
            // copy the text to clipboard
            onPressed: () {
              FlutterClipboard.copy(widget.text).then((value) => _key
                  .currentState!
                  .showSnackBar(const SnackBar(content: Text('Copied'))));
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(
          widget.text.isEmpty ? 'No Text Available' : widget.text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'roboto', fontSize: 50),
        ),
      ),
    );
  }
}
