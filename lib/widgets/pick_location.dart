import 'package:flutter/material.dart';


class PickLocation extends StatefulWidget {
  @override
  _PickLocationState createState() => _PickLocationState();
}


class _PickLocationState extends State<PickLocation> {
  String previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      Container(
        height: 170,
        width: double.infinity,
        child: previewImageUrl == null ?Text("no location here"):Image.network(
          previewImageUrl,fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      Row(
        children: <Widget>[
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.location_on), label:
          Text("current locatlion")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map), label:
          Text("slected map")),
        ],
      ),
    ],
    );
  }
}
