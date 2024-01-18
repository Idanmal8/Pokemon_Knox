import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          // pokemon.spriteUrl != null ? Image.network(pokemon.spriteUrl ?? '') : const Icon(Icons.error),
          const SizedBox(width: 20),
          Text(pokemon.name, style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
