import 'package:pokemon_knox/pages/my_team_list_screen/my_team_list_screen.dart';
import 'package:pokemon_knox/pages/nav_bar_screen/nav_nar_screen.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';
import 'package:pokemon_knox/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, controller, _) {
          return MaterialApp(
            theme: myRedWhiteTheme,
            home: const NavBarScreen(),
          );
        },
      ),
    );
  }
}
