import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/greate_places.dart';
import './screen/places_list_screen.dart';
import './screen/add_places_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Places',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.green,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (ctx)=>AddPlacesScreen(),
        },
      ),
    );
  }
}
// dfd