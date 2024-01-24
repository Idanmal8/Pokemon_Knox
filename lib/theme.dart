import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';

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
  iconTheme: const IconThemeData(
    color: Colors.black, // Icon color
  ),
);

void getTypeColor(Pokemon pokemon) {
  switch (pokemon.types.first.toLowerCase()) {
    case 'normal':
      pokemon.primaryTypeColor = const Color.fromARGB(255,168,168,120);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,184,185,171);
      return;
    case 'fire':
      pokemon.primaryTypeColor = const Color.fromARGB(255,240,128,48);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 251, 201, 39);  
      return;
    case 'water':
      pokemon.primaryTypeColor = const Color.fromARGB(255,104,144,240);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 104, 204, 240);
      return;
    case 'electric':
      pokemon.primaryTypeColor = const Color.fromARGB(255,248,208,48);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 255, 207, 17); 
      return;
    case 'grass':
      pokemon.primaryTypeColor = const Color.fromARGB(255,120,200,80);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 133, 255, 33);
      return;
    case 'ice':
      pokemon.primaryTypeColor = const Color.fromARGB(255,152,216,216);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 176, 255, 255);
      return;
    case 'fighting':
      pokemon.primaryTypeColor = const Color.fromARGB(255,192,48,40);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 252, 42, 42); 
      return;
    case 'poison':
      pokemon.primaryTypeColor = const Color.fromARGB(255,160,64,160);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 226, 144, 226);
      return;
    case 'ground':
      pokemon.primaryTypeColor = const Color.fromARGB(255,224,192,104);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,224,192,104);
      return;
    case 'flying':
      pokemon.primaryTypeColor = const Color.fromARGB(255,168,144,240);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,168,144,240);
      return;
    case 'psychic':
      pokemon.primaryTypeColor = const Color.fromARGB(255,248,88,136);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 255, 139, 174);
      return;
    case 'bug':
      pokemon.primaryTypeColor = const Color.fromARGB(255,168,184,32);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 239, 255, 93);
      return;
    case 'rock':
      pokemon.primaryTypeColor = const Color.fromARGB(255,184,160,56);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 255, 220, 66);
      return;
    case 'ghost':
      pokemon.primaryTypeColor = const Color.fromARGB(255,112,88,152);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 156, 136, 188);
      return;
    case 'dragon':
      pokemon.primaryTypeColor = const Color.fromARGB(255,112,56,248);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,230,121,116);
      return;
    case 'dark':
      pokemon.primaryTypeColor = const Color.fromARGB(255,112,88,72);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,218,176,212);
      return;
    case 'steel':
      pokemon.primaryTypeColor = const Color.fromARGB(255,184,184,208);
      pokemon.secondaryTypeColor = const Color.fromARGB(255,184,185,206);
      return;
    case 'fairy':
      pokemon.primaryTypeColor = const Color.fromARGB(255,238,153,172);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 220, 171, 182);
      return;
    case 'stellar':
      pokemon.primaryTypeColor = const Color.fromARGB(255,53,172,231);
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 209, 141, 255);
      return;
    default:
      pokemon.primaryTypeColor = const Color.fromARGB(255, 255, 255, 255); // Default color if type not matched
      pokemon.secondaryTypeColor = const Color.fromARGB(255, 181, 181, 181); // Default color if type not matched
      return;
  }
}
