import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/widgets/expansion_tile.dart';

class MySearchDelegate extends SearchDelegate {
  final List<String> names;
  String result = '';
  MySearchDelegate(
    this.names,
  );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, result);
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
    // final suggestions = names.where(
    //     (element) => element.toLowerCase().contains(query.toLowerCase()));
    // return ListView.builder(
    //   itemCount: suggestions.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       title: Text(suggestions.elementAt(index)),
    //       onTap: () {
    //         result = suggestions.elementAt(index);
    //         close(context, result);
    //       },
    //     );
    //   },
    // );
    /////////////////////////////////////////////////////////////////////////////////////////

    // final data = names.where(
    //    (element) => element.toLowerCase().contains(query.toLowerCase()));
    return FutureBuilder<List<AutoCompleteLedgerList?>>(
        future: RemoteService().getAutoCompleteLedgerList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;
          log('dataaaaaaaaa---------$data');

          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    log('ddddddd$index');
                  },
                  title: Text(data?[index]!.name ?? ""),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ExpansionTileScreen();

//     FutureBuilder<List<AutoCompleteLedgerList?>>(
//         future: RemoteService().getAutoCompleteLedgerList(query: query),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const CircularProgressIndicator();
//           }
//           List<AutoCompleteLedgerList?>? data = snapshot.data;
//           return ListView.builder(
//               itemCount: data?.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 NewSalesOrderData(indexGetter: data?[index])));
//                     log('zzzzzzz----$index');
//                   },
//                   title: Text(data?[index]!.name ?? ""),
// //title: Text(data![0]?.name??''),
//                 );
//               });
//         });
  }
}

const names = [
  "aa",
  "bb",
  "cc",
  "da",
  "fb",
  "gc",
  "ha",
  "jb",
  "kc",
  "qa",
  "wba",
  "ecf",
  "aad",
  "bba",
  "ccasd"
];
