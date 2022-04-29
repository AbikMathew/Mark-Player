import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mark_player/main.dart';
import 'package:mark_player/screens/onBoardingScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'FolderScreen.dart';
import '../model/model.dart';
import 'navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool permissionGranted = false;
  List<VideoDetailsBox> fullDatabaseList = [];
  List<Uint8List> thumblist = [];
  List<String> pathList = [];
  var permissionStat;

  @override
  initState() {
    super.initState();
    //  requestPermission().then((_) =>
    _navigateToWhichScreen();
  }

  _navigateToWhichScreen() {
    if (prefs.getBool('isFirstTime') == false) {
      fullDatabaseList = box.values.toList();

      for (var i = 0; i < fullDatabaseList.length; i++) {
        pathList.add(fullDatabaseList[i].videoFilePath);
        thumblist.add(fullDatabaseList[i].thumbnailPath);
      }

      Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => CustomNavbar(
              pathList: pathList,
              fullDatabaseList: fullDatabaseList,
              thumblist: thumblist),
        ),
      );
    } else {
      _navigateToOnboardingScreen();
    }
  }

  _navigateToOnboardingScreen() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }

  Future requestPermission() async {
    var requestStatus = await Permission.storage.status;

    if (requestStatus.isDenied) {
      permissionStat = Permission.storage.request();
      print('Completed requesting ketooooooooooooooo');

      // if(key.isGranted){
      //    _navigateToWhichScreen();
      // }
      // requestPermission();
    }
    // if (requestStatus.isGranted) {
    //   _navigateToWhichScreen();
    // }
  }
  // Future _getStoragePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     setState(() {
  //       permissionGranted = true;
  //     });
  //     _navigateToWhichScreen();
  //   }
  //   else if (await Permission.storage.request().isPermanentlyDenied) {
  //     await openAppSettings();
  //   }
  //   else if (await Permission.storage.request().isDenied) {

  //     setState(() {
  //       permissionGranted = false;
  //     });
  //   }
  // }

//  void permissionChecker() async{
//     final status = await Permission.storage.request();
//     print('objectobjectobjectobject');

// if (status == PermissionStatus.granted) {
//   print('Permission granted');
//   _navigateToWhichScreen();
// } else if (status == PermissionStatus.denied) {
//   print('Denied. Show a dialog with a reason and again ask for the permission.');
//   permissionChecker();
// } else if (status == PermissionStatus.permanentlyDenied) {
//   print('Take the user to the settings page.');
// }}

  @override
  Widget build(BuildContext context) {
    // requestPermission();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Icon(Icons.circle_outlined, size: 100),
                  Positioned(
                      top: 16,
                      right: 14,
                      child: Icon(Icons.play_arrow, size: 70))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mark ',
                      style: TextStyle(
                          color: Theme.of(context).listTileTheme.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text('Player',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
