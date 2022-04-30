import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    
    primarySwatch: Colors.grey,
      //primarySwatch: MaterialColor(),
      //buttonTheme: ,
      canvasColor: Color(0xFF2D3545),
      primaryColor: Color(0xFF212938),
      scaffoldBackgroundColor: Color(0xFF212938),
      iconTheme: IconThemeData(color: Color(0xFFD6B392)),

     // appBarTheme: AppBarTheme(textTheme: TextTheme(headline6: TextStyle(color: Colors.amber)), titleTextStyle: TextStyle(color: Colors.amber)),

      inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.white) ),
      popupMenuTheme: PopupMenuThemeData(
       //   color: Color(0xFFD6B392),
       color: Color(0xFF212938),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: TextStyle(color: Colors.white)),
      listTileTheme: ListTileThemeData(
          textColor: Color(0xFFF0F0F0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Color(0xFF2D3545)),
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xFFD6B392)),
        bodyText1: TextStyle(color: Color(0xFFF0F0F0)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color(0xFF2D3545),
      ));

  static final lightTheme =
      ThemeData(scaffoldBackgroundColor: Color(0xFFD6B392));
}
