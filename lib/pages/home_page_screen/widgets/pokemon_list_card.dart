import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/theme.dart';
import 'package:flutter/material.dart';

class PokemonListCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;

  const PokemonListCard({
    super.key,
    required this.pokemon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = getTypeColor(pokemon.types.first); // Get color based on the first type of the pokemon

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor, // Use the color obtained from getTypeColor
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: pokemon.frontDefaultSprite != null
                  ? Image.network(pokemon.frontDefaultSprite ?? '')
                  : const Icon(Icons.error)),
            const SizedBox(width: 20),
            Text(pokemon.name, style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
