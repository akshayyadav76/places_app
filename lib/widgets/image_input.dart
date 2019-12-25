import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storeImage;

  Future<void> _takeImage() async {
    final imageFile =
        await ImagePicker.pickImage(
            source: ImageSource.camera,
            maxWidth: 600,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 150,
          width: 160,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.amberAccent)),
          child: _storeImage != null
              ? Image.file(
                  _storeImage,
                  fit: BoxFit.fill,
                  width: double.infinity,
                )
              : Text("no image"),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takeImage,
            icon: Icon(Icons.camera),
            label: Text("Take Image"),
            textColor: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
