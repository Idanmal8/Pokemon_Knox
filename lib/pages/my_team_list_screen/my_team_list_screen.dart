import 'package:flutter/material.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_card_tile.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_serach_bottom_sheet.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return PokemonCardTile(
                  onTap: () => _showAddPokemonBottomSheet(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddPokemonBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddPokemonBottomSheet();
      },
    );
  }
}
