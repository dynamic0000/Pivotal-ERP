import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:pivotal_erp/view/widgets/my_search_delegate.dart';

class SelectCustomer extends StatefulWidget {
  const SelectCustomer({Key? key}) : super(key: key);

  @override
  State<SelectCustomer> createState() => _SelectCustomerState();
}

class _SelectCustomerState extends State<SelectCustomer> {
  String query = '';
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
        body: FutureBuilder<List<AutoCompleteLedgerList?>>(
            future: RemoteService().getAutoCompleteLedgerList(query: query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              List<AutoCompleteLedgerList?>? data = snapshot.data;
              log('fffffffffffsssssfffffffffff${data![4]?.ledgerGroup}');
              List<Map<String, dynamic>> result = [];
              List<String> keys = [];
              // data.toString.groupBy((m) => m['LedgerGroupId']);

              for (var f in data) {
                keys.add(f!.ledgerGroup!);
              }
              for (var k in [...keys.toSet()]) {
                List datas = [...data.where((e) => e?.ledgerGroup == k)];
                result.add({k: datas});
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
                            color: Colors.black
                            // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                            ),
                      ),
                      children: [
                        ...result[index].values.first.map(
                          (e) {
                            log("result--------------$result[index]");
                            return Container(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewSalesOrder(indexGetter: e)));
                                  log('zzzzzzz----$index');
                                  log('ddddddddddddddddd${result[index].values}');
                                  // log('----------------------$e.first.name');
                                },
                                title: Text(
                                  //'',
                                  e.name,

                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList()
                      ],
                    );
                  });
            })
        // ExpansionTileScreen()
        );
  }
}
