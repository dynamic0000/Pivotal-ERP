import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';

import 'package:pivotal_erp/models/autocompleteproductList_model.dart';
import 'package:pivotal_erp/models/getproductdetails_model.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:searchfield/searchfield.dart';

class AddItem extends StatefulWidget {
  const AddItem({
    Key? key,
    required this.bearerToken,
    required this.voucherId,
    required this.customerName,
    required this.customerAddress,
    required this.panNo,
    required this.creditLimit,
    required this.creditDays,
  }) : super(key: key);
  final String bearerToken;
  final int? voucherId;
  final String? customerName;
  final String? customerAddress;
  final String? panNo;
  final double? creditLimit;
  final int? creditDays;

  //int? productId;

  @override
  State<AddItem> createState() => _AddItemState();
}

var product = AutoCompleteProductList(
  name: '',
  alias: '',
  code: '',
  productGroup: '',
  partNo: '',
  productGroupId: 0,
  productId: 0,
  unit: '0',
  unitId: 0,
);
var newData;

int? quantity = 0;
double? amount;
double? rate;
double? discount;
int productIdx = 0;
double? discountAmount;
//AutoCompleteProductList? product;
String query = '';
AutoCompleteLedgerList? containerValue;

@override
void initState() {
  productIdx = 0;
}

class _AddItemState extends State<AddItem> {
  var rateController = TextEditingController();
  var unitController = TextEditingController();
  var quantityController = TextEditingController();
  var amountController = TextEditingController();
  var discountController = TextEditingController();

  //final int? productId;
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
                    builder: (context) => NewSalesOrder(
                      bearerToken: widget.bearerToken,
                      indexGetter: null,
                      voucherIdpass: widget.voucherId?.toInt(),
                      creditDays: widget.creditDays,
                      creditLimit: widget.creditLimit,
                      customerName: widget.customerName,
                      customerAddress: widget.customerAddress,
                    ),
                  ),
                );
                setState(() {
                  productIdx = 0;
                  newData = RemoteService()
                      .getProductDetials(productIdx, widget.bearerToken);
                });
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewSalesOrder(
                                quantityReq: int.parse(quantityController.text),
                                amountReq: double.parse(amountController.text),
                                productNameReq: product.name,
                                rateReq: double.parse(rateController.text),
                                indexGetter: null,
                                bearerToken: widget.bearerToken,
                                productId: product.productId,
                                unitId: product.unitId,
                                disAmt: int.parse(discountController.text),
                                voucherIdpass: widget.voucherId?.toInt(),
                                creditDays: widget.creditDays,
                                creditLimit: widget.creditLimit,
                                customerName: widget.customerName,
                                customerAddress: widget.customerAddress,
                              )));
                  setState(() {
                    productIdx = 0;
                    newData = RemoteService()
                        .getProductDetials(productIdx, widget.bearerToken);
                  });
                  log("voucherIDwidget--------${widget.voucherId}");
                },
                icon: Icon(
                  Icons.verified_rounded,
                  size: 30.sp,
                )),
            IconButton(
                onPressed: () {
                  //  log("voucherID -------$voucherIdpass");
                  //    RemoteService().saveSalesInvoices(voucherId: );
                },
                icon: const Icon(Icons.coronavirus))
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

            return FutureBuilder<GetProductDetails?>(
              future: newData,
              builder: (context, snapshot) {
                GetProductDetails? productDetials = snapshot.data;

                /////////////////////////////////////
                addProductList({item, itemIndex}) {
                  setState(() {
                    product = item;
                    productIdx = itemIndex;
                    newData = RemoteService()
                        .getProductDetials(productIdx, widget.bearerToken);
                    newData.then((productDetials) {
                      rateController.text =
                          productDetials!.salesRate.toString();

                      unitController.text = productDetials!.baseUnit.toString();
                    });
                  });
                }

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
                                      onChanged: (value) {
                                        setState(() {
                                          newData.then((productDetials) {
                                            quantity = int.parse(
                                                quantityController.text);

                                            rate = double.parse(
                                                rateController.text);

                                            amount = quantity! * rate!;

                                            log("rate-------$rate");

                                            log("intQuantity-----------$quantity");

                                            log("amount--------$amount");
                                            amountController.text =
                                                amount.toString();
                                          });
                                        });
                                      },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 90.w,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          newData.then((productDetials) {
                                            quantity = int.parse(
                                                quantityController.text);
                                            rate = double.parse(
                                                rateController.text);
                                            discount = double.parse(
                                                discountController.text);
                                            discountAmount = (quantity! *
                                                    rate! *
                                                    discount!) /
                                                100;
                                            amount = (quantity! * rate!) -
                                                discountAmount!;

                                            log("rate-------$discountAmount");

                                            log("intQuantity-----------$quantity");
                                            //log("amountValue---------${quantity! * rate!}");
                                            log("amountAfterDiscount--------$amount");
                                            amountController.text =
                                                amount.toString();
                                          });
                                        });
                                      },
                                      controller: discountController,
                                      decoration: InputDecoration(
                                          label: Text(
                                        'Discount %',
                                        style: textStyle,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                    child: TextFormField(
                                      initialValue: '0',
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90.w,
                                    child: TextFormField(
                                      controller: amountController,
                                      readOnly: true,
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
                                              '0'),
                                      _rowData('Alternate Unit',
                                          'N/A'), ////int.parse(product.code) value rakhda error aauxa hera
                                      _rowData(
                                          'Last Sale Rate',
                                          productDetials?.salesRate
                                                  .toString() ??
                                              '0'),
                                      _rowData(
                                          'Last Sale Quantity',
                                          productDetials?.outQty.toString() ??
                                              '0'),
                                      _rowData('Alias',
                                          productDetials?.alias ?? '0'),
                                      _rowData(
                                          'Code', productDetials?.code ?? '0'),
                                      _rowData('Product Group',
                                          productDetials?.productGroup ?? '0'),
                                      _rowData(
                                          'Product Category',
                                          productDetials?.productCategories ??
                                              '0'),
                                      _rowData('Product Type',
                                          productDetials?.productType ?? '0'),
                                      _rowData(
                                          'Vat Rate',
                                          productDetials?.vatRate.toString() ??
                                              '0'),
                                      _rowData(
                                          'EXDutyRate',
                                          productDetials?.exDutyRate
                                                  .toString() ??
                                              '0'),

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
