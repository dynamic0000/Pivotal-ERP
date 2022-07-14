import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';

import 'package:pivotal_erp/models/autocompleteproductList_model.dart';
import 'package:pivotal_erp/models/getproductdetails_model.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:searchfield/searchfield.dart';

class AddItem extends StatefulWidget {
  const AddItem({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;

  @override
  State<AddItem> createState() => _AddItemState();
}

var product = AutoCompleteProductList(
    name: '',
    alias: '',
    code: '',
    productGroup: '',
    partNo: '',
    productGroupId: 2,
    productId: 0,
    unit: '',
    unitId: 5);

var data2 = GetProductDetails(
    productId: 0,
    productGroupId: 0,
    name: '',
    closingQty: 0,
    salesRate: 0.0,
    outQty: 0.0,
    alias: '',
    code: '',
    productGroup: '',
    productCategories: '',
    productType: '',
    vatRate: 0,
    exDutyRate: 0);

int productIdx = 0;
//AutoCompleteProductList? product;
String query = '';
@override
void initState() {
  // TODO: implement initState
  var data2 = GetProductDetails(
      productId: 0,
      productGroupId: 0,
      name: '',
      closingQty: 0,
      salesRate: 0.0,
      outQty: 0.0,
      alias: '',
      code: '',
      productGroup: '',
      productCategories: '',
      productType: '',
      vatRate: 0,
      exDutyRate: 0);
  productIdx = 0;
}

class _AddItemState extends State<AddItem> {
  //String query = '';

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
                              bearerToken: '',
                            )));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () async {
                  var result = await RemoteService().getProductDetials(1);
                  log('resultProductDetials---$result');
                },
                icon: Icon(
                  Icons.verified_rounded,
                  size: 30.sp,
                ))
          ],
        ),
        body: FutureBuilder<List<AutoCompleteProductList?>>(
          future: RemoteService()
              .getAutoCompleteProductList(widget.bearerToken, query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<AutoCompleteProductList?>? data1 = snapshot.data;

            addProductList({item, itemIndex}) {
              setState(() {
                product = item;
                productIdx = itemIndex;
                // product.addAll(item);
                log('pro-------$product');
              });
            }

            // log('data?????????//-------${data1![0]!.name}');

            log('product-------$product');
            // if (data1!.isEmpty) {
            //   return const Center(child: Text("No products"));
            // }
            return SingleChildScrollView(
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
                              // TextDropdownFormField(
                              //   options: data1!.map((e) => e!.unit).toList(),
                              //   decoration: const InputDecoration(
                              //     // hintText: "Select Province",
                              //     suffixIcon: Icon(Icons.arrow_drop_down),
                              //   ),
                              // ),

                              // DropdownButtonFormField(items: data1.map((e) => e!.name),
                              //  onChanged: onChanged)

                              SearchField(
                                searchInputDecoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.arrow_drop_down)),
                                hint: "Select Products",
                                autoCorrect: true,
                                suggestions: data1!
                                    .map((e) => SearchFieldListItem(e!.name))
                                    .toList(),
                                onSuggestionTap: (x) {
                                  var filterItem = data1.firstWhere((e) {
                                    return x.searchKey == e!.name;
                                  });
                                  addProductList(
                                      item: filterItem,
                                      if(itemIndex==null){
                                        return filterItem!.productId=0;
                                      }
                                      itemIndex: filterItem!.productId);
                                  log('indexxxxxxxxxx--------$productIdx');
                                  // log('filtered${filterItem[0]!.name}');
                                  // product.add(x);
                                  //log('product-------${product[0].name}');
                                },
                              ),
                              // DropdownSearch<String>(
                              //   mode: Mode.MENU,
                              //   //to show search box
                              //   showSearchBox: true,
                              //   //showSelectedItem: true,
                              //   //list of dropdown items
                              //   items:
                              //       // data1!.map((e) => e!.name).toList(),
                              //       const [
                              //     "India",
                              //     "USA",
                              //     "Brazil",
                              //     "Canada",
                              //     "Australia",
                              //     "Singapore"
                              //   ],
                              //   hint: 'Select Product',
                              //   // onChanged: print,

                              //   //show selected item
                              //   // selectedItem: "India",
                              //   // dropdownBuilder: (BuildContext String? )?{

                              //   // },
                              // ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Column(
                          //   children: [
                          //     const Text(
                          //       "Quantity*",
                          //       style: TextStyle(
                          //           fontSize: 15,
                          //           fontWeight: FontWeight.w500,
                          //           color: Color.fromARGB(255, 52, 158, 244)),
                          //     ),
                          //     Text(product.code)
                          //   ],
                          // ),

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
                              initialValue: product.unitId.toString(),
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
                FutureBuilder<GetProductDetails?>(
                  future: RemoteService().getProductDetials(productIdx),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      log('isdata???????????----------${snapshot.data}');
                      return Center(
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
                              _rowData('Closing Stock', '0'),
                              _rowData('Alternate Unit',
                                  '0'), ////int.parse(product.code) value rakhda error aauxa hera
                              _rowData('Last Sale Rate', '0'),
                              _rowData('Last Sale Quantity', '0'),
                              _rowData('Alias', '0'),
                              _rowData('Code', '0'),
                              _rowData('Product Group', '0'),
                              _rowData('Product Category', '0'),
                              _rowData('Product Type', '0'),
                              _rowData('Vat Rate', '0'),
                              _rowData('EXDutyRate', '0'),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    var data2 = snapshot.data;
                    log('productIndexxxxyyyyyyyyyy_____$productIdx');
                    return Padding(
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
                            _rowData(
                                'Closing Stock', data2!.closingQty.toString()),
                            _rowData('Alternate Unit',
                                '0'), ////int.parse(product.code) value rakhda error aauxa hera
                            _rowData(
                                'Last Sale Rate', data2.salesRate.toString()),
                            _rowData(
                                'Last Sale Quantity', data2.outQty.toString()),
                            _rowData('Alias', data2.alias),
                            _rowData('Code', data2.code),
                            _rowData('Product Group', data2.productGroup),
                            _rowData(
                                'Product Category', data2.productCategories),
                            _rowData('Product Type', data2.productType),
                            _rowData('Vat Rate', data2.vatRate.toString()),
                            _rowData('EXDutyRate', data2.exDutyRate.toString()),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ]),
            );
          },
        ));
  }

  TextStyle textStyle = const TextStyle(
      color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500);
  Widget _rowData(String title, String? value
      //String value,
      ) {
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
