import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/function/searchFiles.dart';
import '../custom widgets/folder_tile.dart';
import 'package:mark_player/screens/onBoardingScreen.dart';

class homeScreen extends StatefulWidget {
   homeScreen({Key? key, required this.pathList}) : super(key: key);

  List<String> pathList;
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
     for (var i = 0; i < widget.pathList.length; i++) {
            List<String> PathItemsList = widget.pathList[i].split('/').toList();
            repeatedFolderNames
                .add(PathItemsList.elementAt(PathItemsList.length - 2));
            folderNames = repeatedFolderNames.toSet().toList();
            folderNames.remove('0');
            
          }
    super.initState();
  }

  // Variable declarations


  // List<String> folderNames = [
  //   'Movies',
  //   'Camera',
  //   'Downloads',
  //   'Bluetooth',
  //   'Instagram',
  //   'Saved',
  //   'Old videos'
  // ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: appBar(title: 'Home'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: folderNames.length,
            itemBuilder: ((context, index) {
              return folderTile(folderNames: folderNames, index: index, pathList: widget.pathList );
      //   return ListTile(title: Text('kando'),);
            })),
      ),
      //   bottomNavigationBar: customNavbar()
    );
  }
}
