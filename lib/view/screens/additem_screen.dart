import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autoCompleteProductList_model.dart';





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
    return FutureBuilder<List<AutoCompleteProductList?>>(
        future: RemoteService().getAutoCompleteProductList(),
        builder: (context, snapshot) {
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  suggestions: items
                                      .map((e) => SearchFieldListItem(e))
                                      .toList(),
                                ),
                              ],
                            )),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
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
        });
  }

  final values = ListView.builder(itemBuilder: (context, index) {
    return Container();
  });

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

  final items = ['file', 'book', 'chewing gum'];
}
