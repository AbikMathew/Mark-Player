import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Repository/favourites_repository.dart';
import '../model/model.dart';

class FavoritesController extends GetxController{

 final Box<FavouritesBox> favObservableBox = FavouritesRepository.getFavouritesBox();

 addToFav(String path){
    favObservableBox.add(FavouritesBox(favVideoPath: path));
    update();
 }
 deleteFromFav(int index){
    favObservableBox.deleteAt(index);
    update();
 }
}  
