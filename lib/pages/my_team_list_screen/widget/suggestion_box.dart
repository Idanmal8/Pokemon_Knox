import 'package:flutter/material.dart';

class SuggestionBox extends StatelessWidget {
  final List<String> suggestions;
  final Function(String) onSelected;

  const SuggestionBox({
    super.key,
    required this.suggestions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
            onTap: () => {onSelected(suggestions[index])},
          );
        },
      ),
    );
  }
}
