import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';


class MoviesPage extends StatefulWidget {
  MoviesPage({Key? key, required this.moviesTitle, required this.pathList, required this.thumbList})
      : super(key: key);

  String moviesTitle;
  List<String> pathList;
  List<Uint8List> thumbList;

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<String> moviesList = [];
  List<Uint8List> moviesListThumb = [];

  fileInFolderLister() {
    for (var i = 0; i < widget.pathList.length; i++) {
      if (widget.pathList[i].contains(widget.moviesTitle)) {
        moviesList.add(widget.pathList[i]);
        moviesListThumb.add(widget.thumbList[i]);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    fileInFolderLister();

    return Scaffold(
      appBar: appBar(title: widget.moviesTitle, visible: true, movieNamesList: moviesList),
      //  bottomNavigationBar: customNavbar(),
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (BuildContext, index) {
            return MovieTile(
              index: index,
              movieNamesList: moviesList,
              pathList: widget.pathList,
              moviesTitle: widget.moviesTitle, 
              thumbnailPhoto: moviesListThumb[index],
              
            );
          }),
      //   bottomNavigationBar: customNavbar(),
    );
  }
}

