import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_search_bar.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_list_card.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/suggestion_box.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class PokemonAddBottomSheet extends StatelessWidget {
  final HomeScreenViewModel controller;
  final int index;

  const PokemonAddBottomSheet({
    required this.controller,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

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
                  onTap: () {
                    Navigator.pop(context);
                    controller.onTapAddPokemonToMyTeam(index);
                  },
                )
        ],
      ),
    );
  }
}
