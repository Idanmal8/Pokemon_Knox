import 'package:flutter/material.dart';
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of items per row
                      crossAxisSpacing: 8.0, // Horizontal space between items
                      mainAxisSpacing: 8.0, // Vertical space between items
                      childAspectRatio: 1.2, // Aspect ratio of the items
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const PokemonTrait(
                          spriteUrl: '', pokemonAdded: false);
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () => {controller.getPokemonList()
                    },
                    child: const Text('get pokemons')),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: controller.pokemonList.length,
                          itemBuilder: (context, index) {
                            final pokemon = controller.pokemonList[index];
                            return ListTile(
                              leading: Image.network(pokemon.frontDefaultSprite ?? '', errorBuilder: (context, error, stackTrace) => const Icon(Icons.error)),
                              title: Text(pokemon.name),
                              onTap: () => controller.goToPokemonDetails(context, pokemon),
                            );
                          },
                        ),
                ),
              ],
            );
          });
        }),
      ),
    );
  }
}
