import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/models/pokemon_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_knox/utils/search_bar/search_bar_handler.dart';

class MyTeamViewModel extends ChangeNotifier with SearchBarHandler {
  final List<PokemonUrl> pokemonNameList;
  Pokemon? _selectedPokemon; // Define _pokemon as a field of the class

  Pokemon? get selectedPokemon => _selectedPokemon;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MyTeamViewModel(
    this.pokemonNameList,
  ) {
    _isLoading = true;
    notifyListeners();

    initSearchBar(_updateSuggestions);

    _isLoading = false;
    notifyListeners();
  }

  void _updateSuggestions(String filter) {
    // Now you can access pokemonNameList because this method is inside the ViewModel
    updateSuggestions(pokemonNameList);
  }

  Future<void> getPokemonInformation(String name) async {
    _isLoading = true;
    notifyListeners();

    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      _selectedPokemon = Pokemon.fromJson(json.decode(response.body));
      suggestions.clear();
      _isLoading = false;
      notifyListeners();
    } else {
      debugPrint('Failed to fetch Pokemon details for: $name');
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSelectedPokemon() {
    _selectedPokemon = null;
    notifyListeners();
  }
}
