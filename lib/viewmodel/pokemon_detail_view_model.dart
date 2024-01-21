import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_knox/models/pokemon.dart';
import 'dart:convert';

class PokemonDetailViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Pokemon? _pokemon; // Define _pokemon as a field of the class
  String? pokemonName;

  Pokemon? get pokemon => _pokemon; // Provide a getter to access _pokemon
  bool get isLoading => _isLoading;

  // The constructor now correctly initializes the _pokemon field
  PokemonDetailViewModel({this.pokemonName, Pokemon? pokemon}) {
    if (pokemon != null) {
      // The Pokemon object was passed in, no need to fetch.
      _pokemon = pokemon;
      // No need to set loading to true since we already have the data.
      notifyListeners();
    } else if (pokemonName != null) {
      // No Pokemon object was passed in, but a name was, so fetch the Pokemon details.
      _isLoading = true;
      notifyListeners();
      getPokemonInformation(pokemonName!).then((_) {
        _isLoading = false;
        notifyListeners();
      });
    }
  }

  Future<void> getPokemonInformation(String name) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      _pokemon = Pokemon.fromJson(json.decode(response.body));
    } else {
      debugPrint('Failed to fetch Pokemon details for: $name');
    }
  }
}
