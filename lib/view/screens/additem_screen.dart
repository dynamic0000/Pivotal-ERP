import 'dart:developer';
import 'dart:html';

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

//String quantity = '';
var product = AutoCompleteProductList(
    name: '',
    alias: '',
    code: '',
    productGroup: '',
    partNo: '',
    productGroupId: 0,
    productId: 0,
    unit: '',
    unitId: 0);

var data2 = GetProductDetails(
    productId: 0,
    productGroupId: 0,
    name: '',
    closingQty: 0,
    salesRate: 8.0,
    outQty: 0.0,
    alias: '',
    code: '',
    productGroup: '',
    productCategories: '',
    productType: '',
    vatRate: 0,
    exDutyRate: 0);
var _quantity = 0;
// var _discount;
var _rate;

// final quantityValue = TextEditingController();
// final discountValue = TextEditingController();
var textController = TextEditingController();

int productIdx = 0;
//AutoCompleteProductList? product;
String query = '';
@override
void initState() {}

class _AddItemState extends State<AddItem> {
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
                setState(() {
                  //productIdx = 0;
                });
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

                log('pro-------$product');
              });
            }

            // log('data?????????//-------${data1![0]!.name}');

            log('product-------$product');

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
                                      itemIndex: filterItem!.productId);
                                  log('indexxxxxxxxxx--------$productIdx');
                                },
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 90.w,
                            child: TextFormField(
                              //controller: quantityValue,
                              initialValue: _quantity.toString(),
                              decoration: InputDecoration(
                                // hintText: '0',
                                label: Text(
                                  _quantity.toString(),
                                  // 'Quantity *',
                                  style: textStyle,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            //  height: 50,
                            width: 90.w,
                            child: TextFormField(
                              // initialValue: '0' ?? product.name,
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
                              //controller: _controller,

                              keyboardType: TextInputType.number,
                              // initialValue: '0',
                              decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),

                                  //hintText: 0.toString(),
                                  label: Text(
                                    //    _rate.toString(),
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
                              //controller: rateValue,
                              //initialValue: 'okay' ?? product.name,
                              decoration: InputDecoration(
                                  label: Text(
                                //_discount.toString(),
                                'Discount %',
                                style: textStyle,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 90.w,
                            child: TextFormField(
                              initialValue: product.unit.toString(),
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
                                //(_rate * _quantity * _discount * 0.01)
                                //  .toString(),

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
                  initialData: GetProductDetails(
                      closingQty: 0,
                      salesRate: 0,
                      outQty: 0,
                      alias: '',
                      code: '0',
                      productCategories: '0',
                      productGroup: '0',
                      vatRate: 0,
                      exDutyRate: 0,
                      productType: '0'),
                  // Container(child: Text(data2.baseUnitId),),
                  future: RemoteService().getProductDetials(productIdx),
                  builder: (context, snapshot) {
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
                            _rowData('Closing Stock',
                                data2?.closingQty.toString() ?? '0'),
                            _rowData('Alternate Unit',
                                '0'), ////int.parse(product.code) value rakhda error aauxa hera
                            _rowData('Last Sale Rate',
                                data2?.salesRate.toString() ?? '0'),
                            _rowData('Last Sale Quantity',
                                data2?.outQty.toString() ?? '0'),
                            _rowData('Alias', data2?.alias ?? '0'),
                            _rowData('Code', data2?.code ?? '0'),
                            _rowData(
                                'Product Group', data2?.productGroup ?? '0'),
                            _rowData('Product Category',
                                data2?.productCategories ?? '0'),
                            _rowData('Product Type', data2?.productType ?? '0'),
                            _rowData(
                                'Vat Rate', data2?.vatRate.toString() ?? '0'),
                            _rowData('EXDutyRate',
                                data2?.exDutyRate.toString() ?? '0'),
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
