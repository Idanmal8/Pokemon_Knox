import 'package:flutter/material.dart';

class PokemonOptionOval extends StatelessWidget {
  final String pokemonPng;
  final VoidCallback? onTap;

  const PokemonOptionOval({
    required this.pokemonPng,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: const CircleBorder(
          side: BorderSide(
            color: Color.fromARGB(157, 192, 159, 61),
            width: 6,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ClipOval(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 216, 193),
                  shape: BoxShape.circle),
              child: Image.network(
                pokemonPng,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
