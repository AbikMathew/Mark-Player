import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/function/searchFiles.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../custom widgets/folder_tile.dart';
import 'package:mark_player/screens/onBoardingScreen.dart';
import '../main.dart';
import '../model/model.dart';

class homeScreen extends StatefulWidget {
  homeScreen(
      {Key? key,
      required this.pathList,
      required this.thumblist,
      required this.fullDatabaseList})
      : super(key: key);

  List<String> pathList;
  List<Uint8List> thumblist;
  List<VideoDetailsBox> fullDatabaseList;

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<String> _pathList = [];
  List<Uint8List> thumblist = [];

  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];

  @override
  void initState() {
    getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Home', visible: false),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<VideoDetailsBox> value, child) {
            List<VideoDetailsBox> _videoDetailsValues = value.values.toList();
            
            return ListView.builder(
                itemCount: folderNames.length,
                itemBuilder: ((context, index) {
                  return folderTile(
                    folderNames: folderNames,
                    index: index,
                    pathList: widget.pathList,
                    thumbList: widget.thumblist,
                  );
                }));
          }
        ),
      ),  //   bottomNavigationBar: customNavbar()
    );
  }

  Future getFiles() async {
    List<String> values = ['mp4', 'avi', 'mov', 'mkv'];
    await SearchFilesInStorage.searchInStorage(
      values,
      (List<String> data) {
        _pathList.clear();
        _pathList.addAll(data);

        addPathOnlytoDB();
      },
      (error) {},
    ); //TODO: implement initState
  }

  Future addPathOnlytoDB() async {
    await box.clear();
    for (var i = 0; i < _pathList.length; i++) {
      box.put(
          i,
          VideoDetailsBox(
              videoFilePath: _pathList[i], thumbnailPath: null, fav: false));
    }
    thumbnailGetter();
  }

  Future thumbnailGetter() async {
    for (var i = 0; i < _pathList.length; i++) {
      Uint8List? tPic = (await VideoThumbnail.thumbnailData(
        video: _pathList[i],
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      ));
      thumblist.add(tPic!);
    }
    addPathnThumbtoDb();
  }

  addPathnThumbtoDb() {
    for (var i = 0; i < _pathList.length; i++) {
      box.put(
          i,
          VideoDetailsBox(videoFilePath: _pathList[i], thumbnailPath: thumblist[i], fav: false));
    }
  }
}


   // box.add(VideoDetailsBox(videoFilePath: pathList[i], thumbnailPath: key, fav: false));

    // List<VideoDetailsBox> fullDatabaseList = [];
    // fullDatabaseList = box.values.toList();

  // DATABASE FUNCTIONS

    //  boxVideos.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));
    //  box.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));

    //  boxVideos.delete(fullDatabaseList[i].key);
    //  box.delete(fullDatabaseList[i].key);
