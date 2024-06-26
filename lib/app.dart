import 'package:pokemon_knox/screens/nav_bar_screen/nav_nar_screen.dart';
import 'package:pokemon_knox/view_models/home_screen_view_model.dart';
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
            home: NavBarScreen(myTeam: controller.myTeamList),
          );
        },
      ),
    );
  }
}
