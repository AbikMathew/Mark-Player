import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';
import 'package:mark_player/global/globalFunction.dart';


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

  List<String> pathlist = [];
  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];

  Future<void> _refresh() async{
    //return Future.delayed(Duration(seconds: 10));
     getFiles(pathlist, repeatedFolderNames, folderNames).then((_) => null);


  }

  shouldChangePathList(){
    Function eq = const ListEquality().equals;
    if(!eq(pathlist,widget.pathList)){
      
    }
  }

  @override
  Widget build(BuildContext context) {
    // fileInFolderLister();
    

    return Scaffold(
      appBar: appBar(title: widget.moviesTitle, visible: true, movieNamesList: widget.pathList),
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

