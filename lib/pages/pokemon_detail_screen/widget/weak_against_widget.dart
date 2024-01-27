import 'package:flutter/material.dart';
import 'package:pokemon_knox/widgets/pokemon_badges.dart';

class WeakAgainestWidget extends StatelessWidget {
  final List<String> weakAgainestList;

  const WeakAgainestWidget({
    required this.weakAgainestList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Weak against:', style: Theme.of(context).textTheme.bodyLarge),
        Wrap(
          spacing: 8.0, 
          runSpacing: 8.0, 
          children: weakAgainestList.map((type) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PokemonTypeBadge(type: type),
            );
          }).toList(),
        ),
      ],
    );
  }
}
