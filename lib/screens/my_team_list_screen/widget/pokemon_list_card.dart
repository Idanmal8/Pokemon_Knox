import 'package:pokemon_knox/models/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonListCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;

  const PokemonListCard({
    required this.pokemon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        color: pokemon.primaryTypeColor,
        child: Column(
          children: [
            ListTile(
              onTap: onTap,
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  pokemon.frontDefaultSprite ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                pokemon.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              subtitle: Text(
                pokemon.types.join(', '),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Flexible(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2, // Set 2 items per row for a 2x2 grid
                childAspectRatio: 3, // Adjust aspect ratio as needed
                children: [
                  _buildAttributeTile(context, 'ID', pokemon.id.toString()),
                  _buildAttributeTile(context, 'Height', '${pokemon.height.toString()}cm'),
                  _buildAttributeTile(context, 'Type', pokemon.types.join(', ')),
                  _buildAttributeTile(context, 'Avarage weight', pokemon.weight.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributeTile(BuildContext context, String title, String value) {
    return Card(
      elevation: 5,
      color: pokemon.secondaryTypeColor,
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        subtitle: Text(value, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
