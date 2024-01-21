import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/viewmodel/pokemon_detail_view_model.dart';
import 'package:provider/provider.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon? pokemon;
  final String? pokemonName;

  const PokemonDetails({
    this.pokemon,
    this.pokemonName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ChangeNotifierProvider<PokemonDetailViewModel>(
        create: (context) => PokemonDetailViewModel(
          pokemon: pokemon,
          pokemonName: pokemonName,
        ),
        child: Consumer<PokemonDetailViewModel>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.pokemon != null) {
              return Center(
                child: Column(
                  children: [
                    Image.network(controller.pokemon?.frontDefaultSprite ?? ''),
                    // ... other details ...
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Pokemon not found.'));
            }
          },
        ),
      ),
    );
  }
}
