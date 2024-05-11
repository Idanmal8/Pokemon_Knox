import 'package:pokemon_knox/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonDetailViewModel extends ChangeNotifier {
  final Pokemon? pokemon;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  PokemonDetailViewModel({required this.pokemon}) {
    _isLoading = true;
    notifyListeners();

    getPokemonAbilities(pokemon!);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPokemonAbilities(Pokemon pokemon) async {
    if(pokemon.abilities != null && pokemon.abilities?.isNotEmpty == true){
      debugPrint('Pokemon abilities already fetched');
      return;
    }
    if (pokemon.id == null || pokemon.id == 0) {
      return;
    }

    try {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemon.id}'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        // Since we are fetching the abilities, we directly access 'abilities' in the JSON
        List<String> abilities =
            (data['moves'] as List<dynamic>).map((abilityData) {
          return abilityData['move']['name'] as String;
        }).toList();

        // Assigning the fetched abilities to the Pokemon object
        pokemon.abilities = abilities;

      } else {
        throw Exception(
            'Failed to load pokemon data with status code ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e as String?);
      throw Exception('Failed to load pokemon data');
    }
  }
}
