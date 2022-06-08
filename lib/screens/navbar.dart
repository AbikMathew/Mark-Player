import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_player/controllers/video_path_controller.dart';
import 'package:mark_player/main.dart';
import '../model/model.dart';
import '../screens/FolderScreen.dart';
import '../screens/settings.dart';
import 'Main Screens/Playlist.dart';
import 'allVideosScreen.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar(
      {Key? key,
      required this.pathList,
      required this.fullDatabaseList,
      required this.thumblist})
      : super(key: key);

  List<String> pathList = [];
  List<Uint8List> thumblist = [];
  List<VideoDetailsBox> fullDatabaseList = [];


  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  initState() {
    print('Checking for the app is being done ');
  //  valueSetter();
  //controller.getFiles();
    super.initState();
  }

  final controller = Get.put(VideoPathController());

  valueSetter() {
    widget.fullDatabaseList = box.values.toList();

    for (var i = 0; i < widget.fullDatabaseList.length; i++) {
      widget.pathList.add(widget.fullDatabaseList[i].videoFilePath);
      widget.thumblist.add(widget.fullDatabaseList[i].thumbnailPath);
    }
  }


  //int currentIndex = 0;
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final screens = [
    homeScreen(pathList: const [], fullDatabaseList: const [], thumblist: const [],),
    allVideosScreen(pathList: const [], 
    // thumblist: [], 
    ),

    PlaylistScreen(),
    //  favoritesScreen(),
    // watchLaterScreen(),
    settingsPage(),
    // MoviesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   body: screens[CurrentIndex],
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            homeScreen(
                pathList: widget.pathList,
                fullDatabaseList: widget.fullDatabaseList,
                thumblist: widget.thumblist, ),
            allVideosScreen(
                pathList: widget.pathList, 
                // thumblist: widget.thumblist
                ),

            PlaylistScreen(),
            //   favoritesScreen(),
            //  watchLaterScreen(),

            const settingsPage(),
            // MoviesPage()
          ],
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          // onTap: (index) => setState(() => _selectedIndex = index),
          onTap: _onTappedBar,
          currentIndex: _selectedIndex,
          unselectedItemColor: Color.fromARGB(255, 141, 133, 126),
          selectedItemColor: Theme.of(context).iconTheme.color,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies_outlined), label: 'All Videos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined), label: 'Playlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ));
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
