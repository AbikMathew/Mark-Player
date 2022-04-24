import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/function/searchFiles.dart';
import '../custom widgets/folder_tile.dart';
import 'package:mark_player/screens/onBoardingScreen.dart';
import 'package:mark_player/screens/onBoardingScreen.dart';

import '../main.dart';
import '../model/model.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key, required this.pathList,required this.thumblist, required this.fullDatabaseList }) : super(key: key);

  List<String> pathList;
  List<Uint8List> thumblist;
  List<VideoDetailsBox> fullDatabaseList;
  // List<String> repeatedFolderNames = [];
  // List<String> folderNames = [];

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<String> repeatedFolderNames = [];
  List<String> folderNames = [];

  @override
  void initState() {
  folderListCreator();
    super.initState();
  }

  // folderListCreator() {
  //   for (var i = 0; i < widget.pathList.length; i++) {
  //     List<String> PathItemsList = widget.pathList[i].split('/').toList();
  //     repeatedFolderNames
  //         .add(PathItemsList.elementAt(PathItemsList.length - 2));
  //     folderNames = repeatedFolderNames.toSet().toList();
  //     folderNames.remove('0');
  //   }
  // }
  folderListCreator() {
    for (var i = 0; i < widget.pathList.length; i++) {
      List<String> PathItemsList = widget.pathList[i].split('/').toList();
      repeatedFolderNames.add(PathItemsList.elementAt(PathItemsList.length - 2));
      folderNames = repeatedFolderNames.toSet().toList();
      folderNames.remove('0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Home'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: folderNames.length,
            itemBuilder: ((context, index) {
              return folderTile(
                  folderNames: folderNames,
                  index: index,
                  pathList: widget.pathList,
                  thumbList: widget.thumblist,);
              //   return ListTile(title: Text('kando'),);
            })),
      ),
      //   bottomNavigationBar: customNavbar()
    );
  }
}
