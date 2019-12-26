import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/places.dart';

class GreatPlaces with ChangeNotifier {
  final List<Places> _items = [];

  List<Places> get items {
    return [..._items];
  }


  void addDate(String title, File takenImage) {
    _items.add(Places(
      id: DateTime.now().toString(),
      title: title,
      image: takenImage,
      location: null,
    ));
    notifyListeners();
  }



}
