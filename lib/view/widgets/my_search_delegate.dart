import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';

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
          log('dataaaaaaaaa---------');

          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;

          // List<Map<String, dynamic>> result = [];
          // List<String> keys = [];

          // data?.forEach((f) => keys.add(f!.ledgerGroup!));

          // for (var k in [...keys.toSet()]) {
          //   List datas = [...data!.where((e) => e?.ledgerGroup == k)];
          //   result.add({k: datas});
          // }

          // log('message$result');

          // log('dataaaaaaaaa---------$data');
          //var newMap = data.reduce((value, element) => {});

// ignore: unused_local_variable
// var newMap = groupBy( data, (Map obj) => obj['release_date']);

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
    return FutureBuilder<List<AutoCompleteLedgerList?>>(
        future: RemoteService().getAutoCompleteLedgerList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;
          log('fffffffffffsssssfffffffffff${data![0]?.ledgerGroup}');
          List<Map<String, dynamic>> result = [];
          List<String> keys = [];

          for (var f in data) {
            keys.add(f!.ledgerGroup!);
          }
          for (var k in [...keys.toSet()]) {
            List datas = [...data.where((e) => e?.ledgerGroup == k)];
            result.add({k: datas});
          }
          // var indItem = (ind) => result[ind].map(((key, value) => value));
          // log('message${indItem(1)}');
          // log('message${(result[0])}');
          //////////////
          return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  initiallyExpanded: true,
                  backgroundColor: const Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    result[index].keys.join(', '),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewSalesOrder(indexGetter: data[index])));
                          log('zzzzzzz----$index');
                          log('ddddddddddddddddd${result[index].values}');
                        },
                        title:
                            // ListView.builder(
                            //     itemBuilder: ((context, index) =>
                            //         Text('${result[index].values}')))
                            Text(
                          '${result[index].values.first[0].name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.black,
                              backgroundColor:
                                  const Color.fromARGB(255, 154, 203, 242)),
                        ),
                      ),
                    )
                  ],
                );
              });
        });
    ////////////////
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
