import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mark_player/main.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../function/searchFiles.dart';
import '../global/globalFunction.dart';
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
    // _navigateToFolderScreen();
   // getFiles();
    //.then((_) => thumbnailGetter());
    super.initState();
  }

  // Variable declarations
  //List<Uint8List> thumblist = [];
  List<String> pathList = [];
  List<Uint8List> thumblist = [];

  List<String> _pathList = [];
  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];
  List<VideoDetailsBox> fullDatabaseList = [];



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
    await prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
  //    _navigateToFolderScreen();
    return WillPopScope(
      onWillPop: () async{
     //   print('back button pressed');
        return false;
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            HapticFeedback.vibrate();
            _navigateToFolderScreen();},
          child: SafeArea(
            child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                 const Icon(Icons.circle_outlined, size: 100),
                 const Positioned(
                      top: 16,
                      right: 14,
                      child:  Icon(Icons.play_arrow, size: 70))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mark ',
                      style: TextStyle(
                          color: Theme.of(context).listTileTheme.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text('Player',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),const SizedBox(height: 80,),
              const Text('Tap on Mark Player to begin', style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
          ),
        ),
      ),
    );
  }
}
