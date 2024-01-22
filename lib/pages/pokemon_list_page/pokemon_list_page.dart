import 'package:flutter/material.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Knox',
            style: Theme.of(context).textTheme.headlineLarge),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: const Center(
        child: Text('Pokemon list'),
      ),
    );
  }
}