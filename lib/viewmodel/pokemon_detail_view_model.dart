import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_knox/models/pokemon.dart';
import 'dart:convert';

class PokemonDetailViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;


}
