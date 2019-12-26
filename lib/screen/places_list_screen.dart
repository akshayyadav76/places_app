import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/add_places_screen.dart';
import '../providers/greate_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listData =Provider.of<GreatPlaces>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Places App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
          )
        ],
      ),
      body:Consumer<GreatPlaces>(
        builder:(context,data,ch)=>data.items.length <=0? ch:ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context,i)=>ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(data.items[i].image),
              ),
              title: Text(data.items[i].title),
              onTap: (){},
            )),
        child: Center(child:Text("no places  add yet")),
      ),

    );
  }
}
