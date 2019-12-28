import 'package:flutter/material.dart';
import 'package:location/location.dart';

class PickLocation extends StatefulWidget {
  @override
  _PickLocationState createState() => _PickLocationState();
}


Future<void>_getLocation()async{
  final locaData= Location().getLocation();
}

class _PickLocationState extends State<PickLocation> {
  String previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      Container(
        //padding: EdgeInsets.all(value),
        margin: EdgeInsets.only(top: 8),
        height: 170,
        decoration: BoxDecoration(border: Border.all()),
        width: double.infinity,
        child: previewImageUrl == null ?Text("no location here"):Image.network(
          previewImageUrl,fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      Row(
        children: <Widget>[
          FlatButton.icon(onPressed: _getLocation, icon: Icon(Icons.location_on), label:
          Text("current locatlion")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map), label:
          Text("slected map")),
        ],
      ),
    ],
    );
  }
}
