import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 117, 189),
        title: const Text(
          "Sales Invoice",
          style: TextStyle(fontSize: 30),
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
              onPressed: () {},
              icon: const Icon(
                // Icons.assignment_turned_in,
                Icons.difference_outlined,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.verified,
                color: Colors.green,
                size: 30,
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
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 169, 213, 248),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Billed To",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
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
                                height: 80,
                                width: 120,
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
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             SelectCustomer()));
                                        },
                                        icon: const Icon(
                                            Icons.add_circle_rounded),
                                        color: Colors.green,
                                        iconSize: 23,
                                      ),
                                      const Text(
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
                      const SizedBox(width: 65),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Invoice No.",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 60,
                            height: 16,
                            child: TextField(
                              focusNode: node1,
                              style: const TextStyle(fontSize: 10),
                              enabled: isEnabled,
                              readOnly: !isEnabled,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Date of Issue",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          GestureDetector(
                              child: SizedBox(
                                  width: 60,
                                  height: 16,
                                  child: Text(formattedText)),
                              onTap: () {
                                _selectDate();
                              }),

                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "Due Date",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 16, 124, 213),
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
                                  height: 20,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2.0, color: Colors.grey)),
                                  ),
                                  child: Text(
                                    formattedDueText,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 80,
                              //   height: 16,
                              //   child: TextFormField(
                              //     // initialValue: formattedText,
                              //     decoration: const InputDecoration(),
                              //     style: const TextStyle(fontSize: 15),
                              //     // readOnly: true,
                              //   ),
                              // ),
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
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 16, 124, 213),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 200,
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
                  const SizedBox(
                    height: 12,
                  ),

                  ///for add line container
                  DottedBorder(
                    color: const Color.fromARGB(255, 194, 194, 194),
                    strokeWidth: 2,
                    radius: const Radius.circular(8),
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
                              const Text(
                                "Add a line",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 182, 182, 182)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
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

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 70,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 70,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
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
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const SizedBox(
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
                      const Text(
                        'Round off',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      const Text(
                        "0.00",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 65,
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
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 65,
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
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 80,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
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
