import 'package:flutter/material.dart';
import 'package:pokemon_knox/models/pokemon_url.dart';

mixin SearchBarHandler on ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String _fillter = '';
  List<String> _suggestions = [];

  List<String> get suggestions => _suggestions;
  
  void initSearchBar(Function(String) onFilterChanged) {
    searchController.addListener(() {
      _fillter = searchController.text;
      onFilterChanged(_fillter);
    });
  }

  String get fillter => _fillter;
  bool get isFillterOn => _fillter != '';
  
  set fillter(String value) {
    if (_fillter == value) return;
    debugPrint('fillter: $value');
    _fillter = value;
    notifyListeners();
  }

  void updateSuggestions(List<PokemonUrl> pokemonNameList) {
    if (fillter.isEmpty) {
      _suggestions = [];
    } else {
      _suggestions = pokemonNameList
          .where((pokemon) => pokemon.name.toLowerCase().contains(fillter.toLowerCase()))
          .map((pokemon) => pokemon.name)
          .toList();
    }
    notifyListeners();
  }


  bool applyFillter(String value) {
    if (fillter == '') return true;

    return value.contains(_fillter);
  }
}
