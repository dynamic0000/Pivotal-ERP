import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
