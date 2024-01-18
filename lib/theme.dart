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

Color getTypeColor(String type) {
  switch (type.toLowerCase()) {
    case 'normal':
      return const Color.fromARGB(255,168,168,120);
    case 'fire':
      return const Color.fromARGB(255,240,128,48);
    case 'water':
      return const Color.fromARGB(255,104,144,240);
    case 'electric':
      return const Color.fromARGB(255,248,208,48);
    case 'grass':
      return const Color.fromARGB(255,120,200,80);
    case 'ice':
      return const Color.fromARGB(255,152,216,216);
    case 'fighting':
      return const Color.fromARGB(255,192,48,40);
    case 'poison':
      return const Color.fromARGB(255,160,64,160);
    case 'ground':
      return const Color.fromARGB(255,224,192,104);
    case 'flying':
      return const Color.fromARGB(255,168,144,240);
    case 'psychic':
      return const Color.fromARGB(255,248,88,136);
    case 'bug':
      return const Color.fromARGB(255,168,184,32);
    case 'rock':
      return const Color.fromARGB(255,184,160,56);
    case 'ghost':
      return const Color.fromARGB(255,112,88,152);
    case 'dragon':
      return const Color.fromARGB(255,112,56,248);
    case 'dark':
      return const Color.fromARGB(255,112,88,72);
    case 'steel':
      return const Color.fromARGB(255,184,184,208);
    case 'fairy':
      return const Color.fromARGB(255,238,153,172);
    case 'stellar':
      return const Color.fromARGB(255,53,172,231);
    default:
      return const Color.fromARGB(255, 255, 255, 255); // Default color if type not matched
  }
}
