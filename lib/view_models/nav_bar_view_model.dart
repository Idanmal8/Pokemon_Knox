import 'package:pokemon_knox/models/pokemon.dart';
import 'package:flutter/material.dart';

class NavBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  List<Pokemon?> myTeam = List.filled(6, null);

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
