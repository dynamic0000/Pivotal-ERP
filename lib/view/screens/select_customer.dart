import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:pivotal_erp/view/widgets/expansion_tile.dart';
import 'package:pivotal_erp/view/widgets/my_search_delegate.dart';

class SelectCustomer extends StatefulWidget {
  const SelectCustomer({Key? key}) : super(key: key);

  @override
  State<SelectCustomer> createState() => _SelectCustomerState();
}

class _SelectCustomerState extends State<SelectCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Customer"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewSalesOrder(
                              indexGetter: null,
                            )));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () async {
                  final result = await showSearch(
                    context: context,
                    delegate: MySearchDelegate(names),
                  );
                  log('result------$result');
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: ExpansionTileScreen());
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
