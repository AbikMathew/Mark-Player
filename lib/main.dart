import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mark_player/screens/splash_screen.dart';
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
 // Hive.registerAdapter(PlaylistNameBoxAdapter());
  Hive.registerAdapter(PlaylistBoxAdapter());
  Hive.registerAdapter(IndividualPlaylistBoxAdapter());
  box = await Hive.openBox<VideoDetailsBox>('MP_Box');
  boxP = await Hive.openBox<PlaylistBox>('MP_BoxP');
  boxPindvidual = await Hive.openBox<IndividualPlaylistBox>('MP_BoxP_indv');
 // playlistBox = await Hive.openBox('playlistBox');

  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(
    //   designSize: Size(360, 800),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (_) {
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
