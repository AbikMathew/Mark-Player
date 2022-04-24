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
      appBar: appBar(title: widget.moviesTitle),
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


 // Future thumbnailGetter() async {
  //   for (var i = 0; i < widget.pathList.length; i++) {
  //     // print('${widget.pathList[i]}');
  //     List<String> video = widget.pathList[i].split('/').toList();
  //     // print(video);
  //     if (video.contains(widget.moviesTitle)) {
  //       String url = video.join('/');
  //       // String name = video[video.length-1];

  //       var key = (await VideoThumbnail.thumbnailData(
  //         video: url,
  //         imageFormat: ImageFormat.JPEG,
  //         maxWidth: 128,
  //         quality: 25,
  //       ));
  //       thumbnailList.add(key);
  //   //    convertUint8ListToString(key);
  //         box.add(VideoDetailsBox(videoFilePath: url, thumbnailPath: key, fav: false));

  //       setState(() {});
  //       viewList.add(url);   
  //     }
  //   }
  // }