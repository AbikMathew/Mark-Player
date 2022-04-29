import 'package:flutter/material.dart';
import 'package:mark_player/screens/splash_screen.dart';

class FristSplash extends StatelessWidget {
  const FristSplash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
        }, child: Icon(Icons.forward)),
      ),
    );
  }
}