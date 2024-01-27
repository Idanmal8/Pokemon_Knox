import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/pages/pokemon_detail_screen/widget/pokemon_abilities_box.dart';
import 'package:pokemon_knox/pages/pokemon_detail_screen/widget/weak_against_widget.dart';
import 'package:pokemon_knox/viewmodel/pokemon_detail_view_model.dart';
import 'package:pokemon_knox/widgets/pokemon_badges.dart';
import 'package:provider/provider.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonDetails({
    this.pokemon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 216, 193),
      appBar: AppBar(
        backgroundColor: pokemon?.primaryTypeColor,
        title: const Text('Details'),
      ),
      body: ChangeNotifierProvider<PokemonDetailViewModel>(
        create: (context) => PokemonDetailViewModel(pokemon: pokemon),
        child: Consumer<PokemonDetailViewModel>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (pokemon != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.5),
                            child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).dialogBackgroundColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Image.network(
                                    pokemon?.frontDefaultSprite ?? '',
                                    fit: BoxFit.contain)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Aligns children to the start of the column
                            children: [
                              Text(
                                pokemon?.name ?? '',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Wrap(
                                spacing:
                                    8.0, // Horizontal space between the badges
                                runSpacing:
                                    8.0, // Vertical space between the lines
                                children: pokemon?.types
                                        .map((type) =>
                                            PokemonTypeBadge(type: type))
                                        .toList() ??
                                    [
                                      Container()
                                    ], // If types is null, provide an empty Container
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      WeakAgainestWidget(
                          weakAgainestList: pokemon?.weaknesses ?? []),
                      const SizedBox(height: 20),
                      controller.pokemon?.abilities != null
                          ? PokemonAbilities(
                              abilities: controller.pokemon?.abilities ?? [])
                          : const Expanded(
                              child:
                                  Center(child: CircularProgressIndicator())),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Pokemon not found.'));
            }
          },
        ),
      ),
    );
  }
}
