import 'package:pokemon_knox/pages/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HomeScreenViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<Pokemon> pokemonList = [];
  static const int maxPokemonCount =
      100; // Maximum number of Pokemons to fetch automatically
  String nextBatchUrl = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  bool get isLoading => _isLoading;

  HomeScreenViewModel() {
    getPokemonList();
  }

  Future<void> getPokemonList() async {
    _isLoading = true;
    notifyListeners();

    await _fetchBatch(nextBatchUrl);

    notifyListeners();
    _isLoading = false;
  }

  Future<void> loadMorePokemons() async {
    if (pokemonList.length < maxPokemonCount && nextBatchUrl.isNotEmpty) {
      await _fetchBatch(nextBatchUrl);
    }
  }

  Future<void> _fetchBatch(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;
      final urls = results.map((result) => result['url'] as String).toList();

      await _processUrls(urls);
      
      pokemonList.sort((a, b) {
        // Handle nulls: treat null as lesser than non-null
        if (a.id == null && b.id == null) {
          return 0; // Both are null, treat as equal
        } else if (a.id == null) {
          return -1; // Nulls are considered lesser
        } else if (b.id == null) {
          return 1; // Nulls are considered lesser
        } else {
          return a.id!.compareTo(b.id!); // Compare non-null ids
        }
      });
      // Replace 'id' with the actual property you have

      notifyListeners(); // Notify listeners after each batch is processed

      final nextUrl = data['next'] as String?;
      if (nextUrl != null && pokemonList.length < maxPokemonCount) {
        nextBatchUrl = nextUrl;
        _fetchBatchInBackground(nextUrl); // Optionally continue fetching
      }
    } else {
      debugPrint('Failed to fetch data for batch: $url');
    }
  }

  Future<void> _fetchBatchInBackground(String url) async {
    try {
      await _fetchBatch(url);
    } catch (e) {
      debugPrint('Error in background fetching: $e');
    }
  }

  Future<void> _processUrls(List<String> urls) async {
    const maxConcurrentRequests = 5; // Reduced from 10 to 5
    List<Future> ongoingRequests = [];

    for (var url in urls) {
      ongoingRequests.add(_fetchPokemon(url));

      if (ongoingRequests.length >= maxConcurrentRequests) {
        await Future.wait(ongoingRequests);
        ongoingRequests = [];
      }
    }

    // Wait for any remaining requests
    await Future.wait(ongoingRequests);
  }

  Future<void> _fetchPokemon(String url) async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        print(pokemonList);
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
      MaterialPageRoute(
          builder: (context) => PokemonDetails(
                pokemon: pokemon,
              )),
    );
  }
}
