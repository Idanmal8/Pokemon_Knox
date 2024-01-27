import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/models/pokemon_url.dart';
import 'package:pokemon_knox/pages/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:pokemon_knox/theme.dart';
import 'package:pokemon_knox/utils/constant.dart';
import 'package:pokemon_knox/utils/search_bar/search_bar_handler.dart';

class HomeScreenViewModel extends ChangeNotifier with SearchBarHandler {
  bool _isLoading = false;
  List<Pokemon> pokemonList = [];
  List<PokemonUrl> _pokemonNameList = [];
  List<Pokemon?> myTeam = List.filled(6, null);

  Pokemon? _selectedPokemon;
  Pokemon? _addPokemonToMyTeam;
  String nextBatchUrl = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  bool get isLoading => _isLoading;
  List<PokemonUrl> get pokemonNameList => _pokemonNameList;
  Pokemon? get selectedPokemon => _selectedPokemon;
  Pokemon? get addPokemonToMyTeam => _addPokemonToMyTeam;
  List<Pokemon?> get myTeamList => myTeam;

  HomeScreenViewModel() {
    initSearchBar(_updateSuggestions);
    getPokemonNameList();
  }

  set selectedPokemon(Pokemon? pokemon) {
    _selectedPokemon = pokemon;
    notifyListeners();
  }

  void _updateSuggestions(String filter) {
    updateSuggestions(pokemonNameList);
  }

  void clearSelectedPokemon() {
    _selectedPokemon = null;
    notifyListeners();
  }

  void onTapAddPokemonToMyTeam(int index) {
    if (index >= 0 && index < myTeam.length) {
      myTeam[index] = _selectedPokemon;
      notifyListeners();
    }
  }

  Future<void> getPokemonNameList() async {
    final response = await http.get(Uri.parse(ApiConstant.nameUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      _pokemonNameList =
          results.map((result) => PokemonUrl.fromJson(result)).toList();
    } else {
      debugPrint('Failed to fetch data for batch: $ApiConstant.nameUrl');
    }
  }

  Future<void> getPokemonInformation(String name) async {
    _isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      _selectedPokemon = Pokemon.fromJson(json.decode(response.body));
      print(_selectedPokemon);
      getTypeColorByPokemon(_selectedPokemon!);
      await getPokemonWeaknesses(_selectedPokemon!);
      suggestions.clear();
      _isLoading = false;
      notifyListeners();
    } else {
      debugPrint('Failed to fetch Pokemon details for: $name');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPokemonWeaknesses(Pokemon pokemon) async{
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type/${pokemon.types.first}'));
    if (response.statusCode == 200){
      final data = json.decode(response.body) as Map<String, dynamic>;
      final damageRelations = data['damage_relations'] as Map<String, dynamic>;
      final doubleDamageFrom = damageRelations['double_damage_from'] as List<dynamic>;
      // final halfDamageFrom = damageRelations['half_damage_from'] as List<dynamic>;
      // final noDamageFrom = damageRelations['no_damage_from'] as List<dynamic>;

      List<String> weaknesses = [];
      for (var damage in doubleDamageFrom){
        weaknesses.add(damage['name'] as String);
      }
      // for (var damage in halfDamageFrom){
      //   weaknesses.add(damage['name'] as String);
      // }
      // for (var damage in noDamageFrom){
      //   weaknesses.add(damage['name'] as String);
      // }
      pokemon.weaknesses = weaknesses;
    } else {
      debugPrint('Failed to fetch Pokemon weaknesses for: ${pokemon.name}');
    }
    return;
  }

  Future<void> getPokemonList() async {
    _isLoading = true;
    notifyListeners();

    await getPokemonNameList();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMorePokemons() async {
    _isLoading = true;
    notifyListeners();

    await _fetchBatch(nextBatchUrl);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _fetchBatch(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      for (var result in results) {
        final pokemonUrl = result['url'] as String;
        await _fetchPokemon(pokemonUrl);
      }

      nextBatchUrl = data['next'] as String? ?? '';
    } else {
      debugPrint('Failed to fetch data for batch: $url');
    }
  }

  Future<void> _fetchPokemon(String url) async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        debugPrint('PokemonAdded');
        pokemonList.add(Pokemon.fromJson(json.decode(res.body)));
      } else {
        debugPrint('Failed to fetch data for Pokemon: $url');
      }
    } catch (e) {
      debugPrint('Error fetching data for a specific Pokemon: $e');
    }
  }

  Future<void> goToPokemonDetails(BuildContext context, Pokemon? pokemon) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PokemonDetails(pokemon: pokemon)),
    );
  }
}
