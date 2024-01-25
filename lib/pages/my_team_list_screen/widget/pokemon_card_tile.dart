import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';

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
                    ? Image.network(pokemon?.frontDefaultSprite ?? '',fit: BoxFit.fitWidth,)
                    : const Icon(Icons.category_sharp),
              ),
          
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pokemon != null
                        ? Text(pokemon!.name)
                        : const Text('Pokemon name',
                            overflow: TextOverflow.ellipsis),
                    pokemon != null
                        ? Text(pokemon!.types.first)
                        : const Text(
                            'Pokemon type',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),
                          ),
                  ],
                ),
              ),
              // Flexible(
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 2,
              //     childAspectRatio: 3, // Adjust aspect ratio as needed
              //     mainAxisSpacing: 4, // Adjust spacing as needed
              //     crossAxisSpacing: 4, // Adjust spacing as needed
              //     physics:
              //         const NeverScrollableScrollPhysics(), // Disable scrolling inside the grid
              //     children: const [
              //       Text('firebalasdasdl', overflow: TextOverflow.ellipsis),
              //       Text('fireball', overflow: TextOverflow.ellipsis),
              //       Text('fireball', overflow: TextOverflow.ellipsis),
              //       Text('fireball', overflow: TextOverflow.ellipsis),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
