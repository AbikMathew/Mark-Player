
import 'package:hive_flutter/hive_flutter.dart';

import '../model/model.dart';

class FavouritesRepository {
  static getFavouritesBox() => Hive.box<FavouritesBox>('MP_BoxFav');
}