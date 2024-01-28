import 'package:pokemon_knox/pages/battle_screen/battle_screen.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/my_team_list_screen.dart';
import 'package:pokemon_knox/viewmodel/nav_bar_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavBarViewModel>(
      create: (context) => NavBarViewModel(),
      child: Consumer<NavBarViewModel>(
        builder: (context, controller, _) {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: const [
                MyTeamScreen(),
                BattleScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: (index) => controller.changeIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shield_outlined),
                  label: 'Battle',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
