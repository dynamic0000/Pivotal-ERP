import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pivotal_erp/screens/sales_dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:pivotal_erp/screens/select_customer.dart';

class NewSalesOrder extends StatefulWidget {
  const NewSalesOrder({Key? key}) : super(key: key);

  @override
  State<NewSalesOrder> createState() => _NewSalesOrderState();
}

class _NewSalesOrderState extends State<NewSalesOrder> {
  bool _checkbox = false;
  DateTime date = DateTime.now();
  late String formattedText = "";

  bool isEnabled = true;
  final node1 = FocusNode();
  final node2 = FocusNode();

  @override
  void initState() {
    super.initState();
    // String formatted = DateFormat.yMEd().format(DateTime.now());
    formattedText = DateFormat("yyyy-MM-dd").format(DateTime.now());
    log('dateeeee$formattedText');
  }

  Future<void> _selectDate() async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2010),
        lastDate: DateTime(2040));
    if (newDate != null && newDate != date) {
      setState(() {
        date = newDate;
        formattedText = DateFormat("yyyy-MM-dd").format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 117, 189),
        title: Text(
          "Sales Invoice",
          style: TextStyle(fontSize: 30),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SalesDashboard()));
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                // Icons.assignment_turned_in,
                Icons.difference_outlined,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.verified,
                color: Colors.green,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 169, 213, 248),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Billed To",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DottedBorder(
                            color: Color.fromARGB(255, 155, 154, 154),
                            strokeWidth: 1,
                            radius: Radius.circular(5),
                            borderType: BorderType.RRect,
                            child: Container(
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 205, 231, 252),
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
                                                      SelectCustomer()));
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             SelectCustomer()));
                                        },
                                        icon: Icon(Icons.add_circle_rounded),
                                        color: Colors.green,
                                        iconSize: 23,
                                      ),
                                      Text(
                                        "Customer",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.green),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(width: 110),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Invoice No.",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 60,
                            height: 16,
                            child: TextField(
                              focusNode: node1,
                              style: TextStyle(fontSize: 10),
                              enabled: isEnabled,
                              readOnly: !isEnabled,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date of Issue",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          GestureDetector(
                              child: Container(
                                  width: 60,
                                  height: 16,
                                  child: Text(formattedText)),
                              onTap: () {
                                _selectDate();
                              }),

                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Due Date",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          // SizedBox(
                          //   height: 35,
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       border: UnderlineInputBorder(),
                          //       suffixIcon: IconButton(
                          //           onPressed: () {},
                          //           icon: Icon(Icons.calendar_today))),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 16, 124, 213),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 215,
                      ),
                      Text(
                        "Line Total",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 16, 124, 213),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  ///for add line container
                  DottedBorder(
                    color: Color.fromARGB(255, 194, 194, 194),
                    strokeWidth: 2,
                    radius: Radius.circular(8),
                    borderType: BorderType.RRect,
                    child: Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_circle_rounded),
                                color: Colors.green,
                                iconSize: 23,
                              ),
                              Text(
                                "Add a line",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 182, 182, 182)),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "Sub Total",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 143, 142, 142)),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Text(
                        "000.00",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "Discount @ ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 143, 142, 142)),
                      ),
                      SizedBox(
                        width: 40,
                        height: 20,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                            hintText: "Rate",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            contentPadding: EdgeInsets.only(top: 28),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      SizedBox(
                        width: 60,
                        height: 20,
                        child: TextField(
                          // textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                            hintText: "000.00",
                            contentPadding: EdgeInsets.only(top: 28),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "Excise @ ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 143, 142, 142)),
                      ),
                      // SizedBox(
                      //   width: 60,
                      // ),
                      SizedBox(
                        width: 40,
                        height: 20,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                              hintText: "Rate",
                              contentPadding: EdgeInsets.only(top: 28),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        width: 60,
                        height: 20,
                        child: TextField(
                          // textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                              hintText: "000.00",
                              contentPadding: EdgeInsets.only(top: 28),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "Tax @ ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 143, 142, 142)),
                      ),
                      // SizedBox(
                      //   width: 60,
                      // ),
                      SizedBox(
                        width: 40,
                        height: 20,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                              hintText: "Rate",
                              contentPadding: EdgeInsets.only(top: 28),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      SizedBox(
                        width: 60,
                        height: 20,
                        child: TextField(
                          // textAlignVertical: TextAlignVertical.bottom,

                          // textAlign: TextAlign.,
                          decoration: InputDecoration(
                              hintText: "000.00",
                              contentPadding: EdgeInsets.only(top: 28),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 68,
                      ),
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
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        "0.00",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                      ),
                      Text(
                        'Grand Amount',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        '0.00',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                      ),
                      Text(
                        'Received Amount',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        width: 86,
                      ),
                      Text(
                        '000.00',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        'Amount Due',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        '0.00',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    // textAlignVertical: TextAlignVertical.bottom,

                    // textAlign: TextAlign.,
                    decoration: InputDecoration(
                        hintText: "Narration",
                        contentPadding: EdgeInsets.only(top: 28),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
