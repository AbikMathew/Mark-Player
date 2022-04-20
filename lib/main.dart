import 'package:flutter/material.dart';
import 'package:mark_player/screens/movies_page.dart';
import 'package:mark_player/screens/settings.dart';
import 'package:mark_player/screens/splash_screen.dart';

import 'provider/theme_provider.dart';
import 'screens/favorites_screen.dart';
import 'screens/FolderScreen.dart';
// import 'screens/watch_later.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  

   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mark Player',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: SplashScreen()
      // screens[index1],
    );
  }
}
