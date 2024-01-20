import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/pages/pokemon_detail_screen/pokemon_detail_screen.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  bool _isLoading = false;
  List<Pokemon> pokemonList = [];
  String nextBatchUrl = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  bool get isLoading => _isLoading;

  HomeScreenViewModel() {
    getPokemonList();
  }

  Future<void> getPokemonList() async {
    _isLoading = true;
    notifyListeners();

    await _fetchBatch(nextBatchUrl);
    scrollController.addListener(_onScroll);

    _isLoading = false;
    notifyListeners();
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent &&
        !isLoading && nextBatchUrl.isNotEmpty) {
      loadMorePokemons();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
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

  Future<void> goToPokemonDetails(BuildContext context, Pokemon pokemon) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PokemonDetails(pokemon: pokemon)),
    );
  }
}
