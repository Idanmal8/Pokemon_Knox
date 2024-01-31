import 'package:pokemon_knox/models/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonDetailViewModel extends ChangeNotifier {
  final Pokemon? pokemon;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  PokemonDetailViewModel({required this.pokemon}) {
    _isLoading = true;
    notifyListeners();

    // getPokemonAbilities(pokemon!);

    _isLoading = false;
    notifyListeners();
  }

  // Future<void> getPokemonAbilities(Pokemon pokemon) async {
  //   print(pokemon.id);
  //   if (pokemon.id == null || pokemon.id == 0) {
  //     return;
  //   }

  //   final response = await http
  //       .get(Uri.parse('https://pokeapi.co/api/v2/ability/${pokemon.id}'));
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as Map<String, dynamic>;
  //     final List<dynamic> pokemonsWithAbility =
  //         data['pokemon'] as List<dynamic>;

  //     // Extracting the Pokémon names that have this ability
  //     List<String> abilities = pokemonsWithAbility.map((pokemonData) {
  //       return pokemonData['pokemon']['name'] as String;
  //     }).toList();

  //     // Assigning the fetched abilities to the Pokemon object
  //     pokemon.abilities = abilities;
  //   } else {
  //     // Handle the case when the server doesn't return a 200 OK response
  //     throw Exception('Failed to load ability data');
  //   }
  // }
}
