import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mark_player/main.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../function/searchFiles.dart';
import '../model/model.dart';
import 'navbar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    addBoolToSF();
    getFiles().then((_) => thumbnailGetter());
    super.initState();
  }

  // Variable declarations
  List<Uint8List> thumblist = [];
  List<String> pathList = [];

  List<String> _pathList = [];
  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];
  List<VideoDetailsBox> fullDatabaseList = [];

  Future getFiles() async {
    List<String> values = ['mp4', 'avi', 'mov', 'mkv'];
    await SearchFilesInStorage.searchInStorage(
      values,
      (List<String> data) {
        _pathList.clear();
        setState(() {
          _pathList.addAll(data);

          for (var i = 0; i < _pathList.length; i++) {
            List<String> PathItemsList = _pathList[i].split('/').toList();
            repeatedFolderNames
                .add(PathItemsList.elementAt(PathItemsList.length - 2));
            folderNames = repeatedFolderNames.toSet().toList();
            folderNames.remove('0');
          }
        });
      },
      (error) {},
    ); //TODO: implement initState
  }

  Future thumbnailGetter() async {
    for (var i = 0; i < _pathList.length; i++) {
      Uint8List? key = (await VideoThumbnail.thumbnailData(
        video: _pathList[i],
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      ));

      box.add(VideoDetailsBox(
          videoFilePath: _pathList[i], thumbnailPath: key, fav: false));

      fullDatabaseList = box.values.toList();

      // DATABASE FUNCTIONS

      //  boxVideos.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));
      //  box.put(fullDatabaseList[i].key, VideoDetailsBox(videoFilePath: 'abik', thumbnailPath: 'karthik', fav: true));

      //  boxVideos.delete(fullDatabaseList[i].key);
      //  box.delete(fullDatabaseList[i].key);
// I JUST TURNED THIS OFF
      // setState(() {});
    }

    print('KittunundOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');

    putDbItemstoLists();
  }

  putDbItemstoLists() {
    for (var i = 0; i < fullDatabaseList.length; i++) {
      pathList.add(fullDatabaseList[i].videoFilePath);
      thumblist.add(fullDatabaseList[i].thumbnailPath);
    }
    _navigateToFolderScreen();
  }

  _navigateToFolderScreen() {
    //Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CustomNavbar(
          pathList: pathList,
          fullDatabaseList: fullDatabaseList,
          thumblist: thumblist,
        ),
      ),
    );
  }

  addBoolToSF() async {
    await prefs.setBool('isFirstTime', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //child: FloatingActionButton(onPressed: _navigateToFolderScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD6B392)),
                  strokeWidth: 4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Fetching videos from the storage',
                style: TextStyle(fontSize: 17, color: Color(0xFFD6B392)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
