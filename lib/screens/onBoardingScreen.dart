import 'package:flutter/material.dart';
import 'package:mark_player/screens/FolderScreen.dart';
import 'package:mark_player/screens/navbar.dart';

import '../function/searchFiles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({ Key? key }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

   @override
  void initState() {
   getFiles();
    super.initState();
  }


  Future getFiles() async{
     List<String> values = ['mp4', 'avi'];
    SearchFilesInStorage.searchInStorage(
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

  // Variable declarations
  List<String> _pathList = [];
  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];

 _navigateToFolderScreen()  {
    //Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => customNavbar(pathList: _pathList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: FloatingActionButton(onPressed: _navigateToFolderScreen))),
    );
  }
}