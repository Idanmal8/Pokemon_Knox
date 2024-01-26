import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/widgets/pokemon_badges.dart';

class PokemonCardTile extends StatelessWidget {
  final Pokemon? pokemon;
  final VoidCallback? onTap;
  final VoidCallback? onArrowTap;

  const PokemonCardTile({
    this.pokemon,
    this.onTap,
    this.onArrowTap,
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
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: pokemon != null
                        ? Image.network(
                            pokemon?.frontDefaultSprite ?? '',
                            fit: BoxFit.contain,
                          )
                        : const Icon(Icons.category_sharp),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min, // Use minimum size for the column
                      children: [
                        pokemon != null
                            ? Text(pokemon!.name,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineLarge)
                            : const Text('Pokemon name',
                                overflow: TextOverflow.ellipsis),
                        pokemon != null
                            ? Text(
                                pokemon!.types.first,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            : const Text(
                                'Pokemon type',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Strong against:',
                            overflow: TextOverflow.ellipsis),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 0.0,
                          children: pokemon != null &&
                                  pokemon!.weaknesses.isNotEmpty
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
              Positioned(
                right: 4, // Adjust the padding as needed
                top: 0,
                bottom: 0,
                child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 30.0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.transparent)), // Transparent border
                    backgroundColor: MaterialStateProperty.all(
                        Colors.transparent), // Transparent background
                    overlayColor: MaterialStateProperty.all(Colors.transparent
                        .withOpacity(0.1)), // Slight overlay color on press
                  ),
                  onPressed: () => {
                  onArrowTap?.call()
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
