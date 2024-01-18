import 'package:flutter/material.dart';

final ThemeData myRedWhiteTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white, // Background color for Scaffold widgets
  appBarTheme: const AppBarTheme(
    color: Colors.white, // AppBar background color
    iconTheme: IconThemeData(color: Colors.red), // AppBar icon color
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: 'PixelifySans', fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
    headlineSmall: TextStyle(fontFamily: 'PixelifySans', fontSize: 16.0, color: Colors.black),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red, // Button background color
    textTheme: ButtonTextTheme.primary,
  ),
);

