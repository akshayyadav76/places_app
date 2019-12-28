import "dart:io";

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../providers/greate_places.dart';


class AddPlacesScreen extends StatefulWidget {
  static const routeName ="/addPlacesScreen";

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {

final _titleController=TextEditingController();

File _saveImage;


void _selcetedImage(File takenImage){
  _saveImage =takenImage;
  print(takenImage);
}

  void _saveData(){
  if(_titleController.text.isEmpty || _saveImage ==null){
    return;
  }
  Provider.of<GreatPlaces>(context,listen: false)
      .addPlace(_titleController.text, _saveImage);
  Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
  print("workng");
    return Scaffold(
      appBar: AppBar(
        title: Text("add a place"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "title"),
                    controller: _titleController,

                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selcetedImage),
                ],
              ),
            ),
          ),

          RaisedButton.icon(
            onPressed: _saveData,
            icon: Icon(Icons.add),
            label: Text("add places"),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
