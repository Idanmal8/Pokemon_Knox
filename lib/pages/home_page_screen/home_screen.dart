import 'package:flutter/material.dart';
import 'package:pokemon_knox/pages/home_page_screen/widgets/pokemon_list_card.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_knox/pages/home_page_screen/widgets/pokemon_circuler_trait.dart';
import 'package:pokemon_knox/viewmodel/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Knox',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: ChangeNotifierProvider<HomeScreenViewModel>(
        create: (context) => HomeScreenViewModel(),
        child: Builder(builder: (context) {
          return Consumer<HomeScreenViewModel>(
              builder: (context, controller, _) {
            return SingleChildScrollView( // Wrap Column in SingleChildScrollView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
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
                  controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          itemCount: controller.pokemonList.length,
                          itemBuilder: (context, index) {
                            final pokemon = controller.pokemonList[index];
                            return PokemonListCard(
                              pokemon: pokemon,
                              onTap: () => controller.goToPokemonDetails(context, pokemon),
                            );
                          },
                        ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
