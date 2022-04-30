import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    
    primarySwatch: Colors.grey,
      //primarySwatch: MaterialColor(),
      //buttonTheme: ,
      canvasColor: const Color(0xFF2D3545),
      primaryColor: const Color(0xFF212938),
      scaffoldBackgroundColor: const Color(0xFF212938),
      iconTheme: const IconThemeData(color: Color(0xFFD6B392)),

     // appBarTheme: AppBarTheme(textTheme: TextTheme(headline6: TextStyle(color: Colors.amber)), titleTextStyle: TextStyle(color: Colors.amber)),

      inputDecorationTheme: const InputDecorationTheme(hintStyle: const TextStyle(color: Colors.white) ),
      popupMenuTheme: PopupMenuThemeData(
       //   color: Color(0xFFD6B392),
       color: const Color(0xFF212938),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(color: Colors.white)),
      listTileTheme: ListTileThemeData(
          textColor: const Color(0xFFF0F0F0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: const Color(0xFF2D3545)),
      textTheme: const TextTheme(
        headline6: TextStyle(color: Color(0xFFD6B392)),
        bodyText1: TextStyle(color: Color(0xFFF0F0F0)),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xFF2D3545),
      ));

  static final lightTheme =
      ThemeData(scaffoldBackgroundColor: const Color(0xFFD6B392));
}
