import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';

import 'package:pivotal_erp/view/screens/new_sales_order.dart';

class MySearchDelegate extends SearchDelegate {
  final String bearerToken;
  final int? voucherId;
  String result = '';
  MySearchDelegate({
    required this.bearerToken,
    this.voucherId,
  });

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
    return FutureBuilder<List<AutoCompleteLedgerList?>>(
        future: RemoteService().getAutoCompleteLedgerList(
            query: query,
            bearerTokenDynamic: bearerToken,
            voucherId: voucherId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;

          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: Text(data?[index]!.name ?? ""),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<AutoCompleteLedgerList?>>(
        future: RemoteService().getAutoCompleteLedgerList(
            bearerTokenDynamic: bearerToken,
            query: query,
            voucherId: voucherId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;
          log("data value ---- $data");

          List<Map<String, dynamic>> result = [];
          List<String> keys = [];

          for (var f in data!) {
            keys.add(f!.ledgerGroup!);
          }
          for (var k in [...keys.toSet()]) {
            List datas = [...data.where((e) => e?.ledgerGroup == k)];
            result.add({k: datas});
          }

          if (result.isEmpty) {
            return const Center(child: Text('No data'));
          }
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
                        color: Colors.black),
                  ),
                  children: [
                    ...result[index].values.first.map((lst) {
                      log('index$lst');
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewSalesOrder(
                                          bearerToken: bearerToken,
                                          indexGetter: lst,
                                          voucherIdpass: voucherId,
                                        )));
                          },
                          title: Text(
                            lst.name,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                );
              });
        });
  }
}
