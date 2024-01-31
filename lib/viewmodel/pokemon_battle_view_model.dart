import 'package:pokemon_knox/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PokemonBattleViewModel extends ChangeNotifier {
  List<Pokemon?> _pokemons;
  String? _selectedPokemonImageUrl;

  List<Pokemon?> get pokemons => _pokemons;
  String? get selectedPokemonImageUrl => _selectedPokemonImageUrl;

  PokemonBattleViewModel(this._pokemons);

  set pokemons(List<Pokemon?> value) {
    _pokemons = value;
    notifyListeners();
  }

  List<Pokemon> get nonNullPokemons =>
      _pokemons.where((pokemon) => pokemon != null).cast<Pokemon>().toList();

  void setSelectedPokemonImageUrl(String? url) {
    _selectedPokemonImageUrl = url;
    notifyListeners();
  }

  Future<void> fetchAndSetSelectedPokemonImage(String pokemonName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://img.pokemondb.net/sprites/firered-leafgreen/back-normal/${pokemonName.toLowerCase()}.png'));
      if (response.statusCode == 200) {
        setSelectedPokemonImageUrl(response.request?.url.toString());
      }
    } catch (e) {
      // Handle exceptions or errors.
      debugPrint(e as String?);
    }
  }
}
