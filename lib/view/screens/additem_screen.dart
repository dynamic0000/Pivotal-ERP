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
var newData;
// var data2 = GetProductDetails(
//   salesRate: 0.1,
// );
int? quantity;
int? amount;
int? rate;
int productIdx = 0;
//AutoCompleteProductList? product;
String query = '';
@override
void initState() {
  productIdx = 0;
}

class _AddItemState extends State<AddItem> {
  var rateController = TextEditingController();
  var unitController = TextEditingController();
  var quantityController = TextEditingController();
  var amountController = TextEditingController();
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

            // log('data?????????//-------${data1![0]!.name}');
            // log('ControlerrOUTTTT${rateController.text}');
            // log('product-------$product');

            return FutureBuilder<GetProductDetails?>(
              //  newData = RemoteService().getProductDetials(productIdx);

              future: newData,
              //  RemoteService().getProductDetials(productIdx),
              builder: (context, snapshot) {
                // List<GetProductDetails>
                GetProductDetails? productDetials = snapshot.data;

                /////////////////////////////////////
                addProductList({item, itemIndex}) {
                  setState(() {
                    product = item;
                    productIdx = itemIndex;
                    newData = RemoteService().getProductDetials(productIdx);
                    newData.then((productDetials) {
                      rateController.text =
                          productDetials!.salesRate.toString();
                      // productDetials!.salesRate!.toString();
                      unitController.text = productDetials!.baseUnit.toString();
                    });
                    // log("unitController----------${unitController.text}");

                    //  unitController.text = data1![item]!.unit.toString();
                    //rateController.text = productDetials!.salesRate!.toString();

                    // product.addAll(item);

                    quantity = int.parse(quantityController.text);
                    rate = int.parse(rateController.text);

                    log("intQuantity-----------$quantity");
                    log("intRate---------${rateController.text}");

                    //log("quantity--------------${quantityController.text}");
                  });
                }

                //log('contOutttttttttt${rateController.text}');
                //////////////////////////////////
                // var productDetials = snapshot.data;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        //  color: Colors.grey,
                        width: double.infinity,
                        height: 530.h,
                        child: Column(children: [
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
                                        color:
                                            Color.fromARGB(255, 52, 158, 244)),
                                  ),
                                  SearchField(
                                    searchInputDecoration:
                                        const InputDecoration(
                                            suffixIcon:
                                                Icon(Icons.arrow_drop_down)),
                                    hint: "Select Products",
                                    autoCorrect: true,
                                    suggestions: data1!
                                        .map(
                                            (e) => SearchFieldListItem(e!.name))
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
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    child: TextFormField(
                                      //initialValue: '0',
                                      controller: quantityController,
                                      decoration: InputDecoration(
                                          label: Text(
                                        'Quantity *',
                                        style: textStyle,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90.w,
                                    child: TextFormField(
                                      controller: unitController,
                                      readOnly: true,
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
                                      readOnly: true,

                                      controller: rateController,
                                      //     initialValue: data2.salesRate.toString(),
                                      decoration: InputDecoration(
                                          label: Text(
                                        'Rate *',

                                        //    data2.salesRate.toString(),
                                        style: textStyle,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      initialValue: '0',
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
                                      controller: amountController,
                                      decoration: InputDecoration(
                                          label: Text(
                                        'Amount *',
                                        style: textStyle,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 28),
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
                                          'Closing Stock',
                                          productDetials?.closingQty
                                                  .toString() ??
                                              ''),
                                      _rowData('Alternate Unit',
                                          '0'), ////int.parse(product.code) value rakhda error aauxa hera
                                      _rowData(
                                          'Last Sale Rate',
                                          productDetials?.salesRate
                                                  .toString() ??
                                              ''),
                                      _rowData(
                                          'Last Sale Quantity',
                                          productDetials?.outQty.toString() ??
                                              ''),
                                      _rowData(
                                          'Alias', productDetials?.alias ?? ''),
                                      _rowData(
                                          'Code', productDetials?.code ?? ''),
                                      _rowData('Product Group',
                                          productDetials?.productGroup ?? ''),
                                      _rowData(
                                          'Product Category',
                                          productDetials?.productCategories ??
                                              ''),
                                      _rowData('Product Type',
                                          productDetials?.productType ?? ''),
                                      _rowData(
                                          'Vat Rate',
                                          productDetials?.vatRate.toString() ??
                                              ''),
                                      _rowData(
                                          'EXDutyRate',
                                          productDetials?.exDutyRate
                                                  .toString() ??
                                              ''),

                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
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
