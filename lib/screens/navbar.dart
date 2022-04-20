import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../screens/FolderScreen.dart';
// import '../screens/movies_page.dart';
import '../screens/settings.dart';

import 'allVideosScreen.dart';

class customNavbar extends StatefulWidget {
  customNavbar({Key? key, required this.pathList}) : super(key: key);

  List<String> pathList=[];
  @override
  State<customNavbar> createState() => _customNavbarState();
}

class _customNavbarState extends State<customNavbar> {
  int CurrentIndex = 0;
int _selectedIndex = 0;
final PageController _pageController = PageController();
  final screens = [
    homeScreen(pathList: []),
    allVideosScreen(pathList: []),
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
          homeScreen(pathList: widget.pathList),
          allVideosScreen(pathList: widget.pathList),
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


