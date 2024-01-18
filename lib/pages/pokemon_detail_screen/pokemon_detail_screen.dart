import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetails({
    required this.pokemon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(pokemon.frontDefaultSprite ?? ''),
            Text(pokemon.name),
            Text(pokemon.height.toString()),
            Text(pokemon.weight.toString()),
            Text(pokemon.id.toString()),
            Text(pokemon.types.toString()),
          ],
        ),
      ));
  }
}
