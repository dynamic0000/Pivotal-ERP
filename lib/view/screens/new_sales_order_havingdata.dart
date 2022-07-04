import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/additem_screen.dart';
import 'package:pivotal_erp/view/screens/select_customer.dart';
import 'package:pivotal_erp/view/widgets/my_search_delegate.dart';

class NewSalesOrderData extends StatefulWidget {
  const NewSalesOrderData({
    Key? key,
    required this.indexGetter,
  }) : super(key: key);
  final AutoCompleteLedgerList? indexGetter;
  @override
  // ignore: no_logic_in_create_state
  State<NewSalesOrderData> createState() =>
      _NewSalesOrderDataState(indexGetter);
}

class _NewSalesOrderDataState extends State<NewSalesOrderData> {
  AutoCompleteLedgerList? indexGetter;

  //AutoCompleteLedgerList? aCLL;

  // Size size = MediaQuery.of(context).size;
  bool _checkbox = false;

  late String formattedTextNepali = '';
  late String formattedDueTextNepali = '';
  NepaliDateTime selectedNepaliDate = NepaliDateTime.now();
  NepaliDateTime selectedDueNepaliDate = NepaliDateTime.now();

  bool isEnabled = true;
  final node1 = FocusNode();
  final node2 = FocusNode();

  _NewSalesOrderDataState(this.indexGetter);

  @override
  void initState() {
    super.initState();

    formattedTextNepali =
        NepaliDateFormat('yyyy-MM-dd').format(NepaliDateTime.now());
    formattedDueTextNepali =
        NepaliDateFormat('yyyy-MM-dd').format(NepaliDateTime.now());
  }

  //first issue calendar
  Future<void> _selectedNepaliDate() async {
    NepaliDateTime? pickedNepali = await showMaterialDatePicker(
      context: context,
      initialDate: selectedNepaliDate,
      firstDate: NepaliDateTime(2000),
      lastDate: NepaliDateTime(2090),
    );
    if (pickedNepali != null && pickedNepali != selectedNepaliDate) {
      setState(() {
        selectedNepaliDate = pickedNepali;
        formattedTextNepali =
            NepaliDateFormat("yyyy-MM-dd").format(selectedNepaliDate);
      });
    }
  }

  //second due date calendar
  Future<void> _selectedDueNepaliDate() async {
    NepaliDateTime? pickedDueNepali = await showMaterialDatePicker(
      context: context,
      initialDate: selectedDueNepaliDate,
      firstDate: NepaliDateTime(2000),
      lastDate: NepaliDateTime(2090),
      // language: Language.english,
    );
    if (pickedDueNepali != null && pickedDueNepali != selectedDueNepaliDate) {
      setState(() {
        selectedDueNepaliDate = pickedDueNepali;
        formattedDueTextNepali =
            NepaliDateFormat("yyyy-MM-dd").format(selectedDueNepaliDate);
      });
    }
  }

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future captureImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  Future selectFile() async {
    await FilePicker.platform.pickFiles(allowMultiple: false);
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    // return
    //hasData(context, indexGetter);
    // return FutureBuilder(
    //     future: RemoteService().getAutoCompleteLedgerList(),
    //     builder: (
    //       context,
    //       AsyncSnapshot<List<AutoCompleteLedgerList?>> snapshot,
    //     ) {
    //       // final aCLL = snapshot.data;

    //       // log('indexxxxxxxxxxxxx-----$indexGetter');

    //       // if (indexGetter == null) {
    //       //   return const Center(child: Text('NOooooo'));
    //       // } else {
    //         return hasData(context, indexGetter);
    //       // }
    //     });
    // }

    // Scaffold hasData(BuildContext context, AutoCompleteLedgerList? indexGetter) {
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
                      builder: (context) => const UserHomeScreen()));
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
                // Icons.assignment_turned_in,
                Icons.difference_outlined,
                size: 30.sp,
              )),
          IconButton(
              onPressed: () async {
                final result = await showSearch(
                  context: context,
                  delegate: MySearchDelegate(names),
                );
                log('result------$result');
              },
              icon: Icon(
                Icons.search,
                color: Colors.green,
                size: 30.sp,
              ))
        ],
      ),
      body: data_or_not(context, indexGetter),
    );
  }

  SingleChildScrollView data_or_not(
      BuildContext context, AutoCompleteLedgerList? indexGetter) {
    var customerData = indexGetter == null
        ? noData_addCustomer(context)
        : yesData_addCustomer(context, indexGetter);
    log('testrfgggggggggggggggggggggggggggg');
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 210.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 169, 213, 248),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    customerData,
                    SizedBox(width: 20.w),
                    Column(
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
                          width: 60.w,
                          height: 16.h,
                          child: TextField(
                            focusNode: node1,
                            style: TextStyle(fontSize: 10.sp),
                            enabled: isEnabled,
                            readOnly: !isEnabled,
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
                              onTap: _selectedNepaliDate,
                              child: Container(
                                height: 20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2.0.w, color: Colors.grey)),
                                ),
                                child: Text(
                                  formattedTextNepali,
                                  // formattedText,

                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ),
                            ),

                            // ),
                            IconButton(
                                onPressed: () {
                                  _selectedNepaliDate();
                                },
                                icon: const Icon(
                                  Icons.calendar_today,
                                  size: 18,
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
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: _selectedDueNepaliDate,
                              child: Container(
                                height: 20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2.h, color: Colors.grey)),
                                ),
                                child: Text(
                                  formattedDueTextNepali,
                                  // formattedDueText,

                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  _selectedDueNepaliDate();
                                },
                                icon: const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color.fromARGB(255, 16, 124, 213),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200.w,
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

                ///for add line container
                GestureDetector(
                  child: DottedBorder(
                    color: const Color.fromARGB(255, 194, 194, 194),
                    strokeWidth: 2,
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
                              const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.green,
                                size: 23,
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
                            builder: (context) => const AddItem()));
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          "Sub Total",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color.fromARGB(255, 143, 142, 142),
                          ),
                        ),
                        const Spacer(
                            //width: 140.w,
                            ),
                        Text(
                          "000.00",
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
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          "Discount @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        // const Spacer(),
                        SizedBox(
                          width: 40.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                              hintText: "Rate",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 18.sp),
                              contentPadding: const EdgeInsets.only(top: 28),
                            ),
                          ),
                        ),
                        const Spacer(
                            //width: 140.w,
                            ),
                        SizedBox(
                          width: 60.w,
                          height: 20.h,
                          child: TextField(
                            // textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                              hintText: "000.00",
                              contentPadding: const EdgeInsets.only(top: 28),
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 18.sp),
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
                        Container(width: 40.w, color: Colors.black),

                        Text(
                          "Excise @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        // SizedBox(
                        //   width: 60,
                        // ),
                        SizedBox(
                          width: 40.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                                hintText: "Rate",
                                contentPadding: const EdgeInsets.only(top: 28),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 18.sp)),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 20.h,
                          child: TextField(
                            // textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                                hintText: "000.00",
                                contentPadding: const EdgeInsets.only(top: 28),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 18.sp)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          "Tax @ ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 143, 142, 142)),
                        ),
                        // SizedBox(
                        //   width: 60,
                        // ),
                        SizedBox(
                          width: 40.w,
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                                hintText: "Rate",
                                contentPadding: const EdgeInsets.only(top: 28),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 20.h,
                          child: TextField(
                            // textAlignVertical: TextAlignVertical.bottom,

                            // textAlign: TextAlign.,
                            decoration: InputDecoration(
                                hintText: "000.00",
                                contentPadding: const EdgeInsets.only(top: 28),
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 18.sp)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(width: 40.w, color: Colors.black),
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
                        SizedBox(
                          width: 120.w,
                        ),
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
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          'Grand Amount',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 110.w,
                        ),
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
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          'Received Amount',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 86.w,
                        ),
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
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Container(width: 40.w, color: Colors.black),
                        Text(
                          'Amount Due',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 130.w,
                        ),
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
                  // textAlignVertical: TextAlignVertical.bottom,

                  // textAlign: TextAlign.,
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

  Column noData_addCustomer(
    BuildContext context,
  ) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Billed To",
          style: TextStyle(
              fontSize: 15.sp,
              color: const Color.fromARGB(255, 16, 124, 213),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          child: DottedBorder(
            color: const Color.fromARGB(255, 155, 154, 154),
            strokeWidth: 1,
            radius: const Radius.circular(5),
            borderType: BorderType.RRect,
            child: Container(
                height: 80.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 205, 231, 252),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(
                        Icons.add_circle_rounded,
                        color: Colors.green,
                        size: 23,
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
                    builder: (context) => const SelectCustomer()));
          },
        ),
      ],
    );
  }

  Column yesData_addCustomer(
    BuildContext context,
    AutoCompleteLedgerList? a,
  ) {
    log('aaaaaaaaaaaaaaaaaaaaa----------$a');
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Billed To",
          style: TextStyle(
              fontSize: 15.sp,
              color: const Color.fromARGB(255, 16, 124, 213),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [const Text('Name ::'), Text(a!.name.toString())],
        ),
        Row(
          children: [const Text('Address ::'), Text(a.address.toString())],
        ),
        Row(
          children: [const Text('Pan No. ::'), Text(a.panVatNo.toString())],
        ),
        Row(
          children: [
            const Text('Credit Limit ::'),
            Text(a.creditLimitAmount.toString())
          ],
        ),
        Row(
          children: [
            const Text('OUTSTANDING AMOUNT ::'),
            Text(a.creditLimitDays.toString())
          ],
        ),
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
}

const names = [
  "Sandesh",
  "Aakash",
  "ram",
  "sita"
      "aa",
  "bb",
  "cc",
  "da",
  "fb",
  "gc",
  "ha",
  "jb",
  "kc",
  "qa",
  "wba",
  "ecf",
  "aad",
  "bba",
  "ccasd"
];