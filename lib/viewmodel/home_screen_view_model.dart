import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_knox/models/pokemon.dart';
import 'package:pokemon_knox/pages/pokemon_detail_screen/pokemon_detail_screen.dart';

class HomeScreenViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<Pokemon> pokemonList = [];

  bool get isLoading => _isLoading;
  List<Pokemon> get pokemons => pokemonList;

  Future<void> getPokemonList() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;
      final urls = results.map((result) => result['url'] as String).toList();

      // Process URLs with limited concurrency
      const maxConcurrentRequests = 10;
      List<Future> ongoingRequests = [];
      for (var url in urls) {
        ongoingRequests.add(
          http.get(Uri.parse(url)).then((res) {
            if (res.statusCode == 200) {
              pokemonList.add(Pokemon.fromJson(json.decode(res.body)));
            }
          }).catchError((e) {
            debugPrint('Error fetching data for a specific Pokemon: $e');
          })
        );

        if (ongoingRequests.length >= maxConcurrentRequests) {
          await Future.wait(ongoingRequests);
          ongoingRequests = [];
        }
      }

      // Wait for any remaining requests
      await Future.wait(ongoingRequests);
      debugPrint(pokemonList.first.id.toString());
      notifyListeners();
    } else {
      debugPrint('Failed to fetch data');
    }

    _isLoading = false;
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
