import 'package:flutter/material.dart';

class PokemonAbilities extends StatelessWidget {
  final List<String> abilities;

  const PokemonAbilities({
    super.key,
    required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Abilities:', style: Theme.of(context).textTheme.bodyLarge),
        Wrap(
          spacing: 8.0, 
          runSpacing: 8.0, 
          children: abilities.map((ability) {
            return Chip(
              label: Text(ability),
              backgroundColor: Colors.blue.shade100,
            );
          }).toList(),
        ),
      ],
    );
  }
}
