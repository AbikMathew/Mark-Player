import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';





class favoritesScreen extends StatelessWidget {
  const favoritesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: appBar(title: 'Favorites', visible: false),
      // body: ListView.builder(
      //   itemCount: movieNames.length,
      //   itemBuilder: (BuildContext, index){
      //   return MovieTile(index: index);
      // }),
     //  bottomNavigationBar: customNavbar(),
    );
  }
}