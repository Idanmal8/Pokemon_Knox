import 'package:flutter/material.dart';

class AddPokemonBottomSheet extends StatelessWidget {
  const AddPokemonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        // Actions to perform when the bottom sheet is closed
      },
      builder: (BuildContext context) {
        return Container(
          // height: 250, // Adjust the height as needed
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Add Pokemon',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add action to add the Pokemon
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
