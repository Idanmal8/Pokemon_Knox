import 'package:flutter/material.dart';

class PokemonSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final double? elevation;
  final VoidCallback? onClear;

  const PokemonSearchBar({
    this.controller,
    this.elevation,
    this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentElevation = elevation;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        elevation: currentElevation == null
            ? null
            : MaterialStatePropertyAll(currentElevation),
        controller: controller,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
        hintText: 'search pokemon',
        trailing: [
          if ((controller?.text ?? '') != '')
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller?.clear();
              },
            )
        ],
      ),
    );
  }
}
