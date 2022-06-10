import 'package:flutter/material.dart';

class FavouritesTile extends StatelessWidget {
  const FavouritesTile({Key? key, required this.videoPath}) : super(key: key);
  final String videoPath;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(videoPath));
      //onTap: , 
    
  }
}