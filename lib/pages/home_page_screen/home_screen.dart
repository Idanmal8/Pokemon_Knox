import 'package:flutter/material.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_list_card.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/pokemon_search_bar.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/widget/suggestion_box.dart';
import 'package:pokemon_knox/pages/my_team_list_screen/my_team_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_knox/pages/home_page_screen/widgets/pokemon_circuler_trait.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Pokemon Knox',
                  style: Theme.of(context).textTheme.headlineLarge),
              iconTheme: Theme.of(context).iconTheme,
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('My team'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                MyTeamScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Pokemon list'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!controller.isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  controller.loadMorePokemons();
                }
                return true;
              },
              child: SingleChildScrollView(
                // controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return const PokemonTrait(
                              spriteUrl: '', pokemonAdded: false);
                        },
                      ),
                      PokemonSearchBar(
                        controller: controller.searchController,
                      ),
                      Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.pokemonList.length +
                                (controller.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == controller.pokemonList.length) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              final pokemon = controller.pokemonList[index];
                              return PokemonListCard(
                                pokemon: pokemon,
                                onTap: () => controller.goToPokemonDetails(
                                    context, pokemon),
                              );
                            },
                          ),
                          controller.suggestions.isNotEmpty
                              ? SuggestionBox(
                                  suggestions: controller.suggestions,
                                  onSelected: (String selection) {
                                    controller.goToPokemonDetailsBySearch(
                                        context, selection);
                                  },
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
