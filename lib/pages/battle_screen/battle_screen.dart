import 'package:pokemon_knox/pages/battle_screen/widget/pokemon_option_oval.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_knox/viewmodel/pokemon_battle_view_model.dart';
import 'package:provider/provider.dart';

class BattleScreen extends StatelessWidget {
  final List<Pokemon?> pokemons;

  const BattleScreen({
    required this.pokemons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    Size screenSize = MediaQuery.of(context).size;

    // Assuming you know the original aspect ratio of the grass_field image
    // For example, let's say the original image size is 1000 (width) x 500 (height)
    double originalWidth = 455;
    double originalHeight = 212;

    // Calculate the aspect ratio of the image
    double aspectRatio = originalWidth / originalHeight;

    // Calculate the height that the image will occupy on the screen
    double imageHeight = screenSize.width / aspectRatio;

    // Determine if the device is an iPad-size by checking the width
    bool isTablet = screenSize.width > 600;

    // Define width and height scaling factors
    double heightScale = isTablet ? 0.3 : 0.6; // Larger scale for tablet

    return ChangeNotifierProvider<PokemonBattleViewModel>(
      create: (context) => PokemonBattleViewModel(pokemons),
      child: Consumer<PokemonBattleViewModel>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Battle',
                  style: Theme.of(context).textTheme.headlineLarge),
              iconTheme: IconTheme.of(context),
            ),
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width,
                      height: imageHeight, // Set the height of the container
                      child: Image.asset(
                        'assets/fields/grass_field.png',
                        fit: BoxFit
                            .cover, // Use BoxFit.cover to preserve the aspect ratio
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: screenSize.width / 2,
                        height: screenSize.height,
                        child: controller.selectedPokemonImageUrl != null
                        ? Image.network(
                            controller.selectedPokemonImageUrl!,
                            scale: heightScale,
                          )
                        : Image.asset(
                            'assets/fields/steelix.png',
                            scale: heightScale,
                          ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: screenSize.width / 2,
                        height: (imageHeight / 3) * 2,
                        child: Image.asset('assets/fields/machamp.png',
                            fit: BoxFit.contain, scale: heightScale),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: controller.nonNullPokemons.length,
                    itemBuilder: (context, index) {
                      var pokemon = controller.nonNullPokemons[index];
                      return PokemonOptionOval(
                        pokemonPng: pokemon.frontDefaultSprite ?? '',
                        onTap: () => controller.fetchAndSetSelectedPokemonImage(controller.nonNullPokemons[index].name),
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
}
