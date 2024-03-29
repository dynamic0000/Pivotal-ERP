import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:pivotal_erp/controller/remote_services.dart';

import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/additem_screen.dart';
import 'package:pivotal_erp/view/screens/select_customer.dart';

class NewSalesOrder extends StatefulWidget {
  const NewSalesOrder({
    Key? key,
    required this.indexGetter,
    required this.bearerToken,
    this.quantityReq,
    this.amountReq,
    this.rateReq,
    this.productNameReq,
    this.voucherIdpass,
    this.voucherName,
    this.disAmt,
    this.unitId,
    this.productId,
    this.customerName,
    this.customerAddress,
    this.panNo,
    this.creditLimit,
    this.creditDays,
  }) : super(key: key);
  final AutoCompleteLedgerList? indexGetter;
  final String bearerToken;
  final int? quantityReq;
  final double? amountReq;
  final double? rateReq;
  final String? productNameReq;
  final int? voucherIdpass;
  final String? voucherName;
  final int? disAmt;
  final int? unitId;
  final int? productId;
  final String? customerName;
  final String? customerAddress;
  final String? panNo;
  final double? creditLimit;
  final int? creditDays;

  @override
  // ignore: no_logic_in_create_state
  State<NewSalesOrder> createState() => _NewSalesOrderDataState(
      indexGetter,
      quantityReq,
      amountReq,
      rateReq,
      productNameReq,
      bearerToken,
      voucherIdpass,
      voucherName,
      disAmt,
      unitId,
      productId,
      customerName,
      customerAddress,
      panNo,
      creditLimit,
      creditDays);
}

class _NewSalesOrderDataState extends State<NewSalesOrder> {
  AutoCompleteLedgerList? indexGetter;
  final String bearerToken;
  final int? quantityReq;
  double? amountReq;
  final double? rateReq;
  final String? productNameReq;
  final int? voucherIdpass;
  final String? voucherName;
  final int? disAmt;
  final int? unitId;
  final int? productId;
  final String? customerName;
  final String? customerAddress;
  final String? panNo;
  final double? creditLimit;
  final int? creditDays;

  bool isDataPicked = false;

  bool _checkbox = false;
  late String formattedText = "";
  late String formattedDueText = "";

  late String formattedTextNepali = '';
  late String formattedDueTextNepali = '';
  NepaliDateTime selectedNepaliDate = NepaliDateTime.now();
  NepaliDateTime selectedDueNepaliDate = NepaliDateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDueDate = DateTime.now();

  bool isEnabled = true;

  _NewSalesOrderDataState(
    this.indexGetter,
    this.quantityReq,
    this.amountReq,
    this.rateReq,
    this.productNameReq,
    this.bearerToken,
    this.voucherIdpass,
    this.voucherName,
    this.disAmt,
    this.unitId,
    this.productId,
    this.customerName,
    this.customerAddress,
    this.panNo,
    this.creditLimit,
    this.creditDays,
  );

  @override
  void initState() {
    super.initState();

    formattedTextNepali =
        NepaliDateFormat('yyyy-MM-dd').format(NepaliDateTime.now());
    formattedDueTextNepali =
        NepaliDateFormat('yyyy-MM-dd').format(NepaliDateTime.now());
    formattedText = DateFormat("yyyy-MM-dd").format(DateTime.now());

    formattedDueText = DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2040));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedText = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
    }
  }

  Future<void> _selectDueDate() async {
    final DateTime? pickedDue = await showDatePicker(
        context: context,
        initialDate: selectedDueDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2040));
    if (pickedDue != null && pickedDue != selectedDate) {
      setState(() {
        selectedDueDate = pickedDue;
        formattedDueText = DateFormat("yyyy-MM-dd").format(selectedDueDate);
      });
    }
  }

  File? _file;
  String? _resultFile;
  var cameraName;
  var galleryName;

  Future pickImage() async {
    var galleryFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    galleryName = File(galleryFile!.path);
    setState(() {
      _resultFile = galleryFile.name;
    });
  }

  Future captureImage() async {
    var cameraFile = await ImagePicker().pickImage(source: ImageSource.camera);
    cameraName = File(cameraFile!.path);

    setState(() {
      _resultFile = cameraFile.name;
      log("result file ---------$_resultFile");
    });
  }

  Future selectFile() async {
    var file = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      // type: FileType.custom,
      // allowedExtensions: ['png', 'jpg', 'jpeg']
    );

    _file = File(file!.files.single.path!);
    setState(() {
      _resultFile = file.files.first.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 117, 189),
        title: Text(
          "Sales Invoice",
          style: TextStyle(fontSize: 30.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserHomeScreen(
                            bearerToken: widget.bearerToken,
                          )));
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r))),
                    context: context,
                    builder: (context) => buildSheet());
              },
              icon: Icon(
                Icons.difference_outlined,
                size: 30.sp,
              )),
          IconButton(
              onPressed: () {
                RemoteService().saveSalesInvoices(
                    voucherId: voucherIdpass,
                    actualQty: quantityReq,
                    amount: amountReq,
                    rate: rateReq,
                    unitId: product.unitId,
                    productId: product.productId,
                    discountPer: disAmt,
                    voucherDate: formattedText,
                    bearerTokenDynamic: widget.bearerToken);
                log("userhome1----${widget.bearerToken}");
              },
              icon: const Icon(
                Icons.verified_rounded,
                color: Colors.green,
              )),
        ],
      ),
      body: data_or_not(
          context: context,
          indexGetter: indexGetter,
          quantityReq: quantityReq,
          amountReq: amountReq,
          rateReq: rateReq),
    );
  }

  SingleChildScrollView data_or_not(
      {int? quantityReq,
      double? amountReq,
      double? rateReq,
      String? productNameReq,
      BuildContext? context,
      AutoCompleteLedgerList? indexGetter}) {
    var customerData = indexGetter == null
        ? noData_addCustomer(context!)
        : yesData_addCustomer(context: context!, a: indexGetter);
//////////////condition for file picked display////////
    var dataPicked =
        _resultFile == null ? Container() : fileNameDisplay(context);

    var amountPicked = amountReq == null ? Container() : amountDisplay(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 230.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 205, 227, 245),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                          height: 220.h, width: 160.w, child: customerData),
                    ),
                    VerticalDivider(
                      width: 2.w,
                      indent: 5,
                      endIndent: 5,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    /*for date and invoices field*/
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Invoice No.",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            child: Text(
                              voucherIdpass?.toString() ?? "",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 7, 7, 7),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Date of Issue",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: _selectDate,
                                child: Container(
                                  height: 20.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2.0.w, color: Colors.grey)),
                                  ),
                                  child: Text(
                                    formattedText,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _selectDate();
                                  },
                                  icon: Icon(
                                    Icons.calendar_today,
                                    size: 18.sp,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Due Date",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: _selectDueDate,
                                child: Container(
                                  height: 20.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2.h, color: Colors.grey)),
                                  ),
                                  child: Text(
                                    formattedDueText,
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _selectDueDate();
                                  },
                                  icon: Icon(
                                    Icons.calendar_today,
                                    size: 18.sp,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                dataPicked,
                SizedBox(
                  height: 10.h,
                ),
                amountPicked,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 16, 124, 213),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Line Total",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 16, 124, 213),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),

                /*for add line container*/
                GestureDetector(
                  child: DottedBorder(
                    color: const Color.fromARGB(255, 194, 194, 194),
                    strokeWidth: 2.w,
                    radius: Radius.circular(8.r),
                    borderType: BorderType.RRect,
                    child: Container(
                        height: 35.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.green,
                                size: 23.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Add a line",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: const Color.fromARGB(
                                        255, 182, 182, 182)),
                              )
                            ],
                          ),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddItem(
                                  customerName: indexGetter?.name,
                                  customerAddress: indexGetter?.address,
                                  panNo: indexGetter?.panVatNo,
                                  creditLimit: indexGetter?.creditLimitAmount,
                                  creditDays: indexGetter?.creditLimitDays,

                                  voucherId: voucherIdpass,
                                  //voucherId: voucherIdpass,
                                  bearerToken: widget.bearerToken,
                                )));
                    log("voucherID------$voucherIdpass");
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  indent: 45,
                  color: Colors.grey.withOpacity(.8),
                  thickness: 1,
                ),
                SizedBox(
                  height: 15.h,
                ),
/*for sub total - total amount fields*/
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          "Sub Total",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color.fromARGB(255, 143, 142, 142),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          amountReq?.toString() ?? "000.00",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          "Discount @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                              hintText: "Rate",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 16.sp),
                              contentPadding: const EdgeInsets.only(top: 28),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 50.w,
                          height: 20.h,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "000.00",
                              contentPadding: EdgeInsets.only(top: 28.h),
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          "Excise @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                hintText: "Rate",
                                contentPadding: EdgeInsets.only(top: 28.h),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp)),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 50.w,
                          height: 20.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "000.00",
                                contentPadding: EdgeInsets.only(top: 28.h),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          "Tax @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                hintText: "Rate",
                                contentPadding: EdgeInsets.only(top: 28.h),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                )),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 50.w,
                          height: 20.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "000.00",
                                contentPadding: EdgeInsets.only(top: 28.h),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Checkbox(
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                        Text(
                          'Round off',
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                        const Spacer(),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      indent: 45,
                      color: Colors.grey.withOpacity(.8),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          'Grand Amount',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          '0.00',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          'Received Amount',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                        Text(
                          '000.00',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      indent: 45,
                      color: Colors.grey.withOpacity(.8),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(width: 70.w, color: Colors.transparent),
                        Text(
                          'Amount Due',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                        Text(
                          '0.00',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Narration",
                      contentPadding: const EdgeInsets.only(top: 28),
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 18.sp)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector fileNameDisplay(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 177, 177, 177)),
              borderRadius: BorderRadius.circular(10.r),
              color: const Color.fromARGB(255, 169, 214, 251)),
          height: 30,
          width: double.infinity - 20.w,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(_resultFile ?? '',
                style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 111, 111, 111)
                            .withOpacity(1)))),
          )),
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            context: context,
            builder: (context) => buildSheetForRemoval());
      },
    );
  }

  Container amountDisplay(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color.fromARGB(255, 154, 154, 154)),
          color: const Color.fromARGB(255, 169, 214, 251)),
      height: 45.h,
      width: double.infinity - 20.w,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    amountReq = null;
                    log("amoutReq$amountReq");
                  });
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                  size: 25.sp,
                )),
            Column(
              children: [
                Text(
                  product.name,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                ),
                Text('$quantityReq*$rateReq')
              ],
            ),
            const Spacer(),
            Text(amountReq.toString())
          ],
        ),
      ),
    );
  }

  Column noData_addCustomer(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Billed To",
          style: TextStyle(
              fontSize: 15.sp,
              color: const Color.fromARGB(255, 16, 124, 213),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          child: DottedBorder(
            color: const Color.fromARGB(255, 155, 154, 154),
            strokeWidth: 1,
            radius: Radius.circular(5.h),
            borderType: BorderType.RRect,
            child: Container(
                height: 80.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 205, 231, 252),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.add_circle_rounded,
                        color: Colors.green,
                        size: 23.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Customer",
                        style: TextStyle(fontSize: 15.sp, color: Colors.green),
                      )
                    ],
                  ),
                )),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectCustomer(
                          bearerToken: widget.bearerToken,
                          voucherId: voucherIdpass,
                          amountReq: amountReq,
                          rateReq: rateReq,
                          productNameReq: productNameReq,
                          quantityReq: quantityReq,
                        )));
          },
        ),
      ],
    );
  }

  Column yesData_addCustomer({
    BuildContext? context,
    AutoCompleteLedgerList? a,
  }) {
    log('aaaaaaaaaaaaaaaaaaaaa----------$a');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Billed To",
          style: TextStyle(
              fontSize: 15.sp,
              color: const Color.fromARGB(255, 16, 124, 213),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(a!.name.toString(),
            style: GoogleFonts.mavenPro(
              textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.black.withOpacity(0.8),
              ),
            )),
        SizedBox(
          height: 9.h,
        ),
        Text(a.address.toString(),
            style: GoogleFonts.alegreyaSans(
              textStyle: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey.shade800.withOpacity(1),
              ),
            )),
        SizedBox(
          height: 9.h,
        ),
        _rowData(title: 'Pan no   -', titleData: a.panVatNo.toString()),
        SizedBox(
          height: 9.h,
        ),
        _rowData(
            title: 'Credit Limit   -',
            titleData: a.creditLimitAmount.toString()),
        SizedBox(
          height: 8.h,
        ),
        _rowData(
            title: 'Credit Days   -', titleData: a.creditLimitDays.toString()),
      ],
    );
  }

  Row _rowData({AutoCompleteLedgerList? a, String? title, String? titleData}) {
    return Row(
      children: [
        Text(
          title!,
          style: GoogleFonts.alegreyaSans(
            textStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey.shade800.withOpacity(1),
            ),
          ),
        ),
        Text(titleData!,
            style: GoogleFonts.cantarell(
              textStyle: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey.shade800.withOpacity(1),
              ),
            )),
      ],
    );
  }

  GestureDetector filesColumn(
    BuildContext context,
    String photo,
    String fileType,
    VoidCallback ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(photo))),
            ),
            SizedBox(
              width: 8.h,
            ),
            Text(
              fileType,
              style: TextStyle(fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheet() => SizedBox(
        height: 230.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            filesColumn(
              context,
              "images/gallery.png",
              "Gallery",
              () {
                pickImage();
              },
            ),
            SizedBox(
              height: 6.h,
            ),
            filesColumn(
                context, "images/camera.png", "Camera", () => captureImage()),
            SizedBox(
              height: 6.h,
            ),
            filesColumn(context, "images/upload.png", "Upload file",
                () => selectFile()),
          ],
        ),
      );
  buildSheetForRemoval() => SizedBox(
        height: 130.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            filesColumn(context, "images/dustbin.png", "Remove", () {
              Navigator.pop(context);
              setState(() {
                _resultFile = null;
              });
            }),
          ],
        ),
      );
}
