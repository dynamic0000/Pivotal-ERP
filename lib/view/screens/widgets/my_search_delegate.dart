import 'package:flutter/material.dart';
import 'package:pivotal_erp/screens/new_sales_order.dart';


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
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue
          // borderRadius: BorderRadius.circular(25)
          ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
