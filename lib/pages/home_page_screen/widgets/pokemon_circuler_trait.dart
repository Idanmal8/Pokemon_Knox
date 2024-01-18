import 'package:flutter/material.dart';

class PokemonTrait extends StatelessWidget {
  final String spriteUrl;
  final bool pokemonAdded;

  const PokemonTrait({
    required this.spriteUrl,
    required this.pokemonAdded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: pokemonAdded
          ? ClipOval(child: Image.network(spriteUrl))
          : const Icon(Icons.add,
              size: 30, color: Color.fromARGB(255, 165, 165, 165)),
    );
  }
}
