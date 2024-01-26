import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_add_bottom_sheet.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_card_tile.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('My team', style: Theme.of(context).textTheme.headlineLarge),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Consumer<HomeScreenViewModel>(
        builder: (context, controller, _) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.myTeam.length,
                  itemBuilder: (context, index) {
                    var pokemon = controller.myTeamList[index];
                    return PokemonCardTile(
                      pokemon: pokemon,
                      onTap: () => _showAddPokemonBottomSheet(
                          context, controller, index),
                      onArrowTap: () => controller.goToPokemonDetails(context ,pokemon),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void _showAddPokemonBottomSheet(
    BuildContext context, HomeScreenViewModel controller, int index) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return PokemonAddBottomSheet(controller: controller, index: index);
    },
  );
}
