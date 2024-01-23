import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon_url.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_add_bottom_sheet.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_card_tile.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My team',
                  style: Theme.of(context).textTheme.headlineLarge),
              iconTheme: Theme.of(context).iconTheme,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return PokemonCardTile(
                        onTap: () => _showAddPokemonBottomSheet(context, controller.pokemonNameList),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAddPokemonBottomSheet(BuildContext context, List<PokemonUrl> pokemonNameList) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PokemonAddBottomSheet(context: context, pokemonNameList: pokemonNameList);
      },
    );
  }
}


