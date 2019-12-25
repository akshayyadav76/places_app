import 'package:flutter/foundation.dart';

import '../models/places.dart';


class GreatPlaces with ChangeNotifier{

 final List<Places> _items=[];


 List<Places> get items {
   return [..._items];
 }


}
