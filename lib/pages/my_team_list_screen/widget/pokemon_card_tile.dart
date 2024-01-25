import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/widgets/pokemon_badges.dart';

class PokemonCardTile extends StatelessWidget {
  final Pokemon? pokemon;
  final VoidCallback? onTap;

  const PokemonCardTile({
    this.pokemon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: pokemon?.primaryTypeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: pokemon != null
                    ? Image.network(
                        pokemon?.frontDefaultSprite ?? '',
                        fit: BoxFit.fitWidth,
                      )
                    : const Icon(Icons.category_sharp),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // Use minimum size for the column
                  children: [
                    pokemon != null
                        ? Text(pokemon!.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineLarge)
                        : const Text('Pokemon name',
                            overflow: TextOverflow.ellipsis),
                    pokemon != null
                        ? Text(
                            pokemon!.types.first,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        : const Text(
                            'Pokemon type',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),
                          ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Strong against:',
                        overflow: TextOverflow.ellipsis),
                    Wrap(
                      alignment: WrapAlignment
                          .start, // Aligns children to the start of the wrap
                      spacing: 1.0, // Horizontal space between the badges
                      children: pokemon != null && pokemon!.weaknesses.isNotEmpty
                          ? pokemon!.weaknesses
                              .take(
                                  2) // We only take two types as per your requirement
                              .map((type) => SizedBox(
                                    width:
                                        60, // Assuming the badges fit within 60 pixels
                                    child: PokemonTypeBadge(type: type),
                                  ))
                              .toList()
                          : [
                              const Text(
                                'Pokemon types',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
