import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/additem_screen.dart';
import 'package:pivotal_erp/view/screens/select_customer.dart';

class NewSalesOrder extends StatefulWidget {
  const NewSalesOrder({Key? key}) : super(key: key);

  @override
  State<NewSalesOrder> createState() => _NewSalesOrderState();
}

class _NewSalesOrderState extends State<NewSalesOrder> {
  // Size size = MediaQuery.of(context).size;
  bool _checkbox = false;
  DateTime selectedDate = DateTime.now();
  late String formattedText = "";
  late String formattedDueText = "";
  DateTime selectedDueDate = DateTime.now();

  bool isEnabled = true;
  final node1 = FocusNode();
  final node2 = FocusNode();

  @override
  void initState() {
    super.initState();
    // String formatted = DateFormat.yMEd().format(DateTime.now());
    formattedText = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print('dateeeee$formattedText');
    formattedDueText = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print('dateeeee$formattedDueText');
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

  /// for due date

  // late String formattedText = "";
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

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
    log('abccccc');
  }

  Future captureImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  Future selectFile() async {
    await FilePicker.platform.pickFiles(allowMultiple: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                            topRight: Radius.circular(20.r))
                        // BorderRadius.vertical(top: Radius.circular(20.r))
                        ),
                    context: context,
                    builder: (context) => buildSheet());
              },
              icon: Icon(
                // Icons.assignment_turned_in,
                Icons.difference_outlined,
                size: 30.sp,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.verified,
                color: Colors.green,
                size: 30.sp,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 215.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 169, 213, 248),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Billed To",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color:
                                        const Color.fromARGB(255, 16, 124, 213),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              DottedBorder(
                                color: const Color.fromARGB(255, 155, 154, 154),
                                strokeWidth: 1,
                                radius: const Radius.circular(5),
                                borderType: BorderType.RRect,
                                child: Container(
                                    height: 80.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 205, 231, 252),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SelectCustomer()));
                                            },
                                            icon: const Icon(
                                                Icons.add_circle_rounded),
                                            color: Colors.green,
                                            iconSize: 23,
                                          ),
                                          Text(
                                            "Customer",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.green),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 70.w),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Invoice No.",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color:
                                        const Color.fromARGB(255, 16, 124, 213),
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
                                    color:
                                        const Color.fromARGB(255, 16, 124, 213),
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
                                                width: 1.h,
                                                color: const Color.fromARGB(
                                                    255, 163, 163, 163))),
                                      ),
                                      child: Text(
                                        formattedText,
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ),
                                  ),

                                  // ),
                                  IconButton(
                                      onPressed: () {
                                        _selectDate();
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
                                    color:
                                        const Color.fromARGB(255, 16, 124, 213),
                                    fontWeight: FontWeight.normal),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
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
                                                width: 1.h,
                                                color: const Color.fromARGB(
                                                    255, 163, 163, 163))),
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
                                      icon: const Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //////////////////description and downnnn
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  DottedBorder(
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
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddItem()));
                                },
                                icon: const Icon(Icons.add_circle_rounded),
                                color: Colors.green,
                                iconSize: 23,
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
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 20.w,
                          color: Colors.white),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color.fromARGB(
                                            255, 143, 142, 142)),
                                  ),
                                  SizedBox(
                                    width: 140.w,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(
                                  //   width: 85.w,
                                  // ),
                                  Row(
                                    children: [
                                      Text(
                                        "Discount @ ",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color.fromARGB(
                                                255, 143, 142, 142)),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                        height: 20.h,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,

                                          // textAlign: TextAlign.,
                                          decoration: InputDecoration(
                                            hintText: "Rate",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp),
                                            contentPadding:
                                                const EdgeInsets.only(top: 28),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                    height: 20.h,
                                    child: TextField(
                                      // textAlignVertical: TextAlignVertical.bottom,

                                      // textAlign: TextAlign.,
                                      decoration: InputDecoration(
                                        hintText: "000.00",
                                        contentPadding:
                                            const EdgeInsets.only(top: 28),
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Excise @ ",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color.fromARGB(
                                                255, 143, 142, 142)),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                        height: 20.h,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,

                                          // textAlign: TextAlign.,
                                          decoration: InputDecoration(
                                              hintText: "Rate",
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 28),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18.sp)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 60,
                                  // ),

                                  // SizedBox(
                                  //   width: 100.w,
                                  // ),
                                  SizedBox(
                                    width: 60.w,
                                    height: 20.h,
                                    child: TextField(
                                      // textAlignVertical: TextAlignVertical.bottom,

                                      // textAlign: TextAlign.,
                                      decoration: InputDecoration(
                                          hintText: "000.00",
                                          contentPadding:
                                              const EdgeInsets.only(top: 28),
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18.sp)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tax @ ",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color.fromARGB(
                                                255, 143, 142, 142)),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                        height: 20.h,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,

                                          // textAlign: TextAlign.,
                                          decoration: InputDecoration(
                                              hintText: "Rate",
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 28),
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                    height: 20.h,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "000.00",
                                          contentPadding:
                                              const EdgeInsets.only(top: 28),
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18.sp)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
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
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.grey),
                                      ),
                                    ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                          )),
                    ],
                  ),

                  /////////// end rate field////////////////////

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
      ),
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
