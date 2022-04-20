import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';
import 'package:mark_player/screens/navbar.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage({Key? key, required this.moviesTitle, required this.pathList})
      : super(key: key);

  String moviesTitle;
  List<String> pathList;

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<String> moviesList = [];

  fileInFolderLister() {
    for (var i = 0; i < widget.pathList.length; i++) {
      if (widget.pathList[i].contains(widget.moviesTitle)) {
        moviesList.add(widget.pathList[i]);
      }
    }
  }

  @override
  void initState() {
    thumbnailGetter();
    super.initState();
  }

  List thumbnailList = [];
  List<String> viewList = [];

  Future thumbnailGetter() async {
    for (var i = 0; i < widget.pathList.length; i++) {
      // print('${widget.pathList[i]}');
      List<String> video = widget.pathList[i].split('/').toList();
      // print(video);
      if (video.contains(widget.moviesTitle)) {
        String url = video.join('/');
        // String name = video[video.length-1];

        var key = (await VideoThumbnail.thumbnailData(
          video: url,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 128,
          quality: 25,
        ));
        thumbnailList.add(key);
        setState(() {});
        viewList.add(url);   
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
          itemCount: viewList.length,
          itemBuilder: (BuildContext, index) {
            return MovieTile(
              index: index,
              movieNamesList: moviesList,
              pathList: widget.pathList,
              moviesTitle: widget.moviesTitle, 
              thumbnailPhoto: thumbnailList[index],
            );
          }),
      //   bottomNavigationBar: customNavbar(),
    );
  }
}
