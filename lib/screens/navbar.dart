import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../model/model.dart';
import '../screens/favorites_screen.dart';
import '../screens/FolderScreen.dart';
// import '../screens/movies_page.dart';
import '../screens/settings.dart';

import 'allVideosScreen.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar({Key? key, required this.pathList, required this.fullDatabaseList,required this.thumblist}) : super(key: key);

  List<String> pathList=[];
  List<Uint8List> thumblist = [];
  List<VideoDetailsBox> fullDatabaseList =[];
  

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {

Function? getFiles;

int CurrentIndex = 0;
int _selectedIndex = 0;
var a;

final PageController _pageController = PageController();
  final screens = [
    homeScreen(pathList: [], fullDatabaseList: [], thumblist: [],),
    allVideosScreen(pathList: [], thumblist: [],   ),
    favoritesScreen(),
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
          homeScreen(pathList: widget.pathList, fullDatabaseList: widget.fullDatabaseList, thumblist: widget.thumblist),
          allVideosScreen(pathList: widget.pathList, thumblist: widget.thumblist),
          favoritesScreen(),
        //  watchLaterScreen(),
         
          settingsPage(),
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
                icon: Icon(Icons.favorite_border), label: 'Fav'),
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


