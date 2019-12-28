import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {

  final Function selcectedImage;

  ImageInput(this.selcectedImage);

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
    if(imageFile == null){return;}
    setState(() {
      _storeImage =imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName =  path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
     widget.selcectedImage(savedImage);
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
