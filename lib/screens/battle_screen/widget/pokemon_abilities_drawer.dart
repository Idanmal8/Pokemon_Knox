import 'package:flutter/material.dart';

class PokemonAbilitiesDrawer extends StatelessWidget {
  final double widthOfDrawer;
  final String abilityName;
  final int abilityPrecentegeAgainstFoe;

  const PokemonAbilitiesDrawer({
    required this.widthOfDrawer,
    required this.abilityName,
    required this.abilityPrecentegeAgainstFoe,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfDrawer,
      decoration: const BoxDecoration(
        color: Color.fromARGB(157, 192, 159, 61),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 224, 216, 193),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  abilityName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '$abilityPrecentegeAgainstFoe%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
