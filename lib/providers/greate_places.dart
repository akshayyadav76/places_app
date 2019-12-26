import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/places.dart';
import '../helper/db_helper.dart';

class GreatPlaces with ChangeNotifier {
   List<Places> _items = [];

  List<Places> get items {
    return [..._items];
  }

  void addDate(String title, File takenImage) {
    var newPlaces = Places(
      id: DateTime.now().toString(),
      title: title,
      image: takenImage,
      location: null,
    );
    _items.add(newPlaces);
    notifyListeners();
    DbHlper.insert('user_places', {
      'id': newPlaces.id,
      'title': newPlaces.title,
      'image': newPlaces.image,
    });
  }

  Future<void> fetchGetData() async {
    final dataList = await DbHlper.getData("user_places");
    _items = dataList
        .map((item) => Places(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              //location: null,
            ))
        .toList();
    notifyListeners();
  }
}
