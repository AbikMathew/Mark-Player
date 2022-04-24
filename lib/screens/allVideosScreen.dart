import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';
import 'package:mark_player/screens/navbar.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class allVideosScreen extends StatefulWidget {
  allVideosScreen({Key? key, required this.pathList, required this.thumblist})
      : super(key: key);

  String moviesTitle = 'All Videos';
  List<String> pathList;
  List<Uint8List> thumblist;

  

  @override
  State<allVideosScreen> createState() => _allVideosScreenState();
}

class _allVideosScreenState extends State<allVideosScreen> {
  List<String> moviesList = [];
  List thumbnailList = [];
  List<String> viewList = [];

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    // fileInFolderLister();

    return Scaffold(
      appBar: appBar(title: widget.moviesTitle),
      //  bottomNavigationBar: customNavbar(),
      body: RefreshIndicator(
        //notificationPredicate: true,
        color: Color(0xFFD6B392),
        onRefresh: _refresh,
        child: ListView.builder(
            itemCount: widget.pathList.length,
            itemBuilder: (BuildContext, index) {
              return MovieTile(
                index: index,
                movieNamesList: widget.pathList,
                pathList: widget.pathList,
                moviesTitle: widget.moviesTitle,
                thumbnailPhoto: widget.thumblist[index],
              );
            }),
      ),
      //   bottomNavigationBar: customNavbar(),
    );
  }
}


//  Future thumbnailGetter() async {
//     for (var i = 0; i < widget.pathList.length; i++) {
//       // // print('${widget.pathList[i]}');
//       // List<String> video = widget.pathList[i].split('/').toList();
//       // // print(video);
//       // if (video.contains(widget.moviesTitle)) {
//       //   String url = video.join('/');
//       //   // String name = video[video.length-1];

//       String url = widget.pathList[i];

//       var key = (await VideoThumbnail.thumbnailData(
//         video: url,
//         imageFormat: ImageFormat.JPEG,
//         maxWidth: 128,
//         quality: 25,
//       ));
//       thumbnailList.add(key);
//       setState(() {});
//       viewList.add(url);
//     }
//   }