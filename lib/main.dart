import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/screens/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/model.dart';
import 'provider/theme_provider.dart';

late Box<VideoDetailsBox> box;
late Box<PlaylistBox> boxP;
late Box<IndividualPlaylistBox> boxPindvidual;
late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(VideoDetailsBoxAdapter());
  Hive.registerAdapter(PlaylistBoxAdapter());
  Hive.registerAdapter(IndividualPlaylistBoxAdapter());

  box = await Hive.openBox<VideoDetailsBox>('MP_Box');
  boxP = await Hive.openBox<PlaylistBox>('MP_BoxP');
  boxPindvidual = await Hive.openBox<IndividualPlaylistBox>('MP_BoxP_indv');

  requestPermission();

  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

requestPermission() async {
  var requestStatus = await Permission.storage.status;
  if (requestStatus.isDenied) {
    await Permission.storage.request();
    // }
  }
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
      theme: MyThemes.darkTheme,
      darkTheme: MyThemes.darkTheme,
      home: SplashScreen()
    );
  }
}
