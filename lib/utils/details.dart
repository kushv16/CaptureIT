import 'dart:html';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String text;
  Future<File> imageFile;
  Details(this.text, this.imageFile);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  var imageFileReturn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                FlutterClipboard.copy(widget.text).then((value) => _key
                    .currentState!
                    .showSnackBar(new SnackBar(content: Text('Copied'))));
              },
            )
          ],
        ),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            child: SelectableText(
                widget.text.isEmpty ? 'No Text Available' : widget.text),
          ),
          Container(
            child: showImage(),
          )
        ]));
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: widget.imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        imageFileReturn = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            imageFileReturn,
            width: 400,
            height: 400,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}
