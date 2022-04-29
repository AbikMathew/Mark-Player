import 'package:flutter/material.dart';
import 'package:mark_player/screens/splash_screen.dart';

import '../main.dart';

class FristSplash extends StatefulWidget {
  const FristSplash({ Key? key }) : super(key: key);

  @override
  State<FristSplash> createState() => _FristSplashState();
}

class _FristSplashState extends State<FristSplash> {

    @override
  void initState() {
    shouldSkipSplash0();
    super.initState();
  }

  shouldSkipSplash0(){
    if (prefs.getBool('shouldShowSplash0') == false) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SplashScreen()));
    }
  }

  // @override
  addBoolToSF() async {
    await prefs.setBool('shouldShowSplash0', false);
  }

  @override
  Widget build(BuildContext context) {
    addBoolToSF();
    
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
        }, child: Icon(Icons.forward)),
      ),
    );
  }
}