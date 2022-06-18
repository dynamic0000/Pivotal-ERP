import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String dropdownValue = 'Computer';
  String itemSelect = '';
  final itemSelected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 102, 175),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Icon(Icons.verified_user),
            )
          ],
          title: const Text('Add Item'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewSalesOrder()));
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // DropdownButton<dynamic>(
            //   items: items.map((e) {
            //     return DropdownMenuItem(child: Text(e));
            //   }).toList(),
            //   onChanged: (newValue) {
            //     dropdownValue = newValue;
            //   },
            //   value: dropdownValue,
            // ),
            SizedBox(
              //  color: Colors.grey,
              width: double.infinity,
              height: 230,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                      'Product/Item *',
                      style: textStyle,
                    ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text(
                            'Quantity *',
                            style: textStyle,
                          )),
                        ),
                      ),
                      SizedBox(
                        //  height: 50,
                        width: 90,
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
                        width: 90,
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
                        width: 90,
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
                        width: 90,
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
                        width: 90,
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
                color: Colors.grey[300],
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }

  TextStyle textStyle = const TextStyle(color: Colors.blue);
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
}

List<String> items = ['Computer', 'a', 'a'];
