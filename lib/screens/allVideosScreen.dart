import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';
import 'package:mark_player/screens/navbar.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class allVideosScreen extends StatefulWidget {
  allVideosScreen({Key? key, required this.pathList})
      : super(key: key);

  String moviesTitle = 'All Videos';
  List<String> pathList;

  @override
  State<allVideosScreen> createState() => _allVideosScreenState();
}

class _allVideosScreenState extends State<allVideosScreen> {
  List<String> moviesList = [];

  // fileInFolderLister() {
  //   for (var i = 0; i < widget.pathList.length; i++) {
      
  //       moviesList.add(widget.pathList[i]);
      
  //   }
  // }

  @override
  void initState() {
    thumbnailGetter();
    super.initState();
  }

  List thumbnailList = [];
  List<String> viewList = [];

  Future thumbnailGetter() async {
    for (var i = 0; i < widget.pathList.length; i++) {
      // // print('${widget.pathList[i]}');
      // List<String> video = widget.pathList[i].split('/').toList();
      // // print(video);
      // if (video.contains(widget.moviesTitle)) {
      //   String url = video.join('/');
      //   // String name = video[video.length-1];

      String url = widget.pathList[i];

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


  

  @override
  Widget build(BuildContext context) {
   // fileInFolderLister();

    return Scaffold(
      appBar: appBar(title: widget.moviesTitle),
      //  bottomNavigationBar: customNavbar(),
      body: ListView.builder(
          itemCount: viewList.length,
          itemBuilder: (BuildContext, index) {
            return MovieTile(
              index: index,
              movieNamesList: viewList,
              pathList: widget.pathList,
              moviesTitle: widget.moviesTitle, 
              thumbnailPhoto: thumbnailList[index],
            );
          }),
      //   bottomNavigationBar: customNavbar(),
    );
  }
}
