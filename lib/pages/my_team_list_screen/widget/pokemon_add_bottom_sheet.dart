// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_card_tile.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_list_card.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_knox/models/pokemon_url.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_search_bar.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/suggestion_box.dart';
import 'package:pokemon_knox/viewmodel/my_team_view_model.dart';

class PokemonAddBottomSheet extends StatelessWidget {
  final List<PokemonUrl> pokemonNameList;
  final BuildContext context;

  const PokemonAddBottomSheet({
    required this.pokemonNameList,
    required this.context,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyTeamViewModel>(
      create: (context) => MyTeamViewModel(pokemonNameList),
      child: Consumer<MyTeamViewModel>(
        builder: (context, controller, _) {
          return Container(
            height: double.infinity / 2,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PokemonSearchBar(
                  controller: controller.searchController,
                  onClear: () {
                    controller
                        .clearSelectedPokemon(); // Clear selection when search is cleared
                  },
                ),
                controller.isLoading != true
                    ? Flexible(
                        child: controller.suggestions.isNotEmpty
                            ? SuggestionBox(
                                suggestions: controller.suggestions,
                                onSelected: (String selection) {
                                  // Find the selected Pokemon from pokemonNameList and update the state
                                  controller.getPokemonInformation(selection);
                                },
                              )
                            : const SizedBox.shrink(),
                      )
                    : const Expanded(
                        child: Center(child: CircularProgressIndicator())),
                controller.selectedPokemon == null
                    ? const SizedBox.shrink()
                    : PokemonListCard(
                        pokemon: controller.selectedPokemon!,
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
