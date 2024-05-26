import 'package:pokemon_knox/screens/battle_screen/battle_screen.dart';
import 'package:pokemon_knox/screens/my_team_list_screen/my_team_list_screen.dart';
import 'package:pokemon_knox/screens/pokedex_screen/pokemon_list_page.dart';
import 'package:pokemon_knox/view_models/nav_bar_view_model.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  final List<Pokemon?> myTeam;

  const NavBarScreen({
    super.key,
    required this.myTeam,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavBarViewModel>(
      create: (context) => NavBarViewModel(),
      child: Consumer<NavBarViewModel>(
        builder: (context, controller, _) {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: [
                const PokedexScreen(),
                BattleScreen(pokemons: myTeam),
                const MyTeamScreen(),
                Container(),
                Container(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: (index) => controller.changeIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone),
                  label: 'PokeDex',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Guids',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.catching_pokemon_rounded),
                  label: 'Team',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.backpack),
                  label: 'Items',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
