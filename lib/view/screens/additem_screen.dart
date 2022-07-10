import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:searchfield/searchfield.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String query = '';

  String itemSelect = '';
  final itemSelected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 148, 233),
          title: const Text('Add Item'),
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
                onPressed: () {},
                icon: Icon(
                  Icons.verified_rounded,
                  size: 30.sp,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              //  color: Colors.grey,
              width: double.infinity,
              height: 230.h,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product/Item*",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 52, 158, 244)),
                          ),
                          SearchField(
                            hint: "Select Products",
                            // searchInputDecoration: const InputDecoration(
                            //     enabledBorder: OutlineInputBorder(
                            //         borderSide:
                            //             BorderSide(color: Colors.blueGrey))),
                            suggestions: items
                                .map((e) => SearchFieldListItem(e))
                                .toList(),
                          ),
                          // DropdownSearch<String>(
                          //   mode: Mode.MENU,
                          //   showSelectedItems: true,
                          //   items:
                          //       // productSuggestions(context),
                          //       // productSuggestions(context);
                          //       const ['cash', 'books', 'chicken', 'coke'],
                          //   dropdownSearchDecoration: const InputDecoration(
                          //       hintText: "Select products"),
                          // ),
                        ],
                      )
                      // child: TextFormField(
                      //     decoration: InputDecoration(
                      //         label: Text(
                      //   'Product/Item *',
                      //   style: textStyle,
                      // ))
                      // )
                      // ,
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          initialValue: '0',
                          decoration: InputDecoration(
                              label: Text(
                            'Quantity *',
                            style: textStyle,
                          )),
                        ),
                      ),
                      SizedBox(
                        //  height: 50,
                        width: 90.w,
                        child: TextFormField(
                          initialValue: 'N/A',
                          decoration: InputDecoration(
                            label: Text(
                              'Unit',
                              style: textStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          initialValue: '0',
                          decoration: InputDecoration(
                              label: Text(
                            'Rate *',
                            style: textStyle,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          initialValue: '0',
                          decoration: InputDecoration(
                              label: Text(
                            'Discount %',
                            style: textStyle,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          initialValue: 'N/A',
                          decoration: InputDecoration(
                            label: Text(
                              'Unit',
                              style: textStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          initialValue: '0',
                          decoration: InputDecoration(
                              label: Text(
                            'Amount *',
                            style: textStyle,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    _rowData('Closing Stock', 0),
                    _rowData('Alternative Unit', 0),
                    _rowData('Last Sale Rate', 0),
                    _rowData('Last Sale Quantity', 0),
                    _rowData('Alias', 0),
                    _rowData('Code', 0),
                    _rowData('Product Group', 0),
                    _rowData('Product Category', 0),
                    _rowData('Product Type', 0),
                    _rowData('Vat Rate', 0),
                    _rowData('EXDutyRate', 0),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }

  TextStyle textStyle = const TextStyle(
      color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500);
  Widget _rowData(String title, int? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), const SizedBox(), Text(value.toString())],
      ),
    );
  }

  productSuggestions(context) {
    return FutureBuilder<List<AutoCompleteLedgerList?>>(
        future: RemoteService().getAutoCompleteLedgerList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<AutoCompleteLedgerList?>? data = snapshot.data;
          // log('fffffffffffsssssfffffffffff${data![0]?.ledgerGroup}');
          List<Map<String, dynamic>> result = [];
          List<String> keys = [];

          for (var f in data!) {
            keys.add(f!.ledgerGroup!);
          }
          for (var k in [...keys.toSet()]) {
            List datas = [...data.where((e) => e?.ledgerGroup == k)];
            result.add({k: datas});
          }
          // var indItem = (ind) => result[ind].map(((key, value) => value));
          // log('message${indItem(1)}');

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
                                    builder: (context) =>
                                        NewSalesOrder(indexGetter: lst)));
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

  final items = ['file', 'book', 'chewing gum'];
}
