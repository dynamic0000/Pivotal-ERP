import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/additem_screen.dart';

import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:pivotal_erp/view/widgets/my_search_delegate.dart';

class SelectCustomer extends StatefulWidget {
  const SelectCustomer({
    Key? key,
    required this.bearerToken,
    this.voucherId,
    //this.quantityReq,
    //this.rateReq,
    //this.productNameReq,
    //this.amountReq,
  }) : super(key: key);
  final String bearerToken;
  final int? voucherId;
  /*final int? quantityReq;
  final double? amountReq;
  final double? rateReq;
  final String? productNameReq;*/

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
                      builder: (context) => NewSalesOrder(
                            bearerToken: widget.bearerToken,
                            indexGetter: null,
                            voucherIdpass: widget.voucherId,
                            amountReq: amount,
                            rateReq: rate,
                            productNameReq: product.name,
                            quantityReq: quantity,
                          )));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showSearch(
                  context: context,
                  delegate: MySearchDelegate(
                    bearerToken: widget.bearerToken,
                    voucherId: widget.voucherId,
                  ),
                );
                log('result------$result');
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<AutoCompleteLedgerList?>>(
          future: RemoteService().getAutoCompleteLedgerList(
            query: query,
            bearerTokenDynamic: widget.bearerToken,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            List<AutoCompleteLedgerList?>? data = snapshot.data;

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
              log('qqqqqqqqqqqqqqqqqqq----------${result.isEmpty}');

              return const Center(child: Text('No data'));
            }
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
                                          bearerToken: widget.bearerToken,
                                          voucherIdpass: widget.voucherId,
                                          amountReq: amount,
                                          rateReq: rate,
                                          productNameReq: product.name,
                                          quantityReq: quantity,
                                          indexGetter: lst)));
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
          }),
    );
  }
}
