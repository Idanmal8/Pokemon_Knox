import 'package:pokemon_knox/pages/my_team_list_screen/my_team_list_screen.dart';
import 'package:pokemon_knox/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myRedWhiteTheme,
      home: const MyTeamScreen(),
    );
  }
}