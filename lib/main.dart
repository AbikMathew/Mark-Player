import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/model.dart';
import 'provider/theme_provider.dart';

late Box<VideoDetailsBox> box;
late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(VideoDetailsBoxAdapter());
  box = await Hive.openBox('MP_Box');

  //box.put(1, VideoDetailsBox(videoFilePath: 'videoFilePath', thumbnailPath: 'thumbnailPath', fav: true) );

  // VideoDetailsBox variableName = box.get(1);
  // print(variableName.videoFilePath);
  prefs = await SharedPreferences.getInstance();
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
