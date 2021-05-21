import 'package:flutter/material.dart';

// primary: Color(0xFFFFC72C),
// secondary: Color(0xFFDA291C),

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black87,
      ),
      primarySwatch: Colors.amber,
      primaryColorBrightness: Brightness.light,
      accentColor: Color(0xFFDA291C),
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black87),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        button: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ).apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
    );
  }
}
