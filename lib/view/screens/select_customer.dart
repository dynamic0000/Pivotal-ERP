import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/new_sales_order_havingdata.dart';
import 'package:pivotal_erp/view/widgets/my_search_delegate.dart';

class SelectCustomer extends StatefulWidget {
  const SelectCustomer({Key? key}) : super(key: key);

  @override
  State<SelectCustomer> createState() => _SelectCustomerState();
}

class _SelectCustomerState extends State<SelectCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Customer"),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewSalesOrderData(
                            indexGetter: null,
                          )));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showSearch(
                  context: context,
                  delegate: MySearchDelegate(names),
                );
                log('result------$result');
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 161, 212, 254),
              child: ExpansionTile(
                // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                title: Text(
                  "Cash-in-hand",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black
                      // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                      ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("CASH"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 161, 212, 254),
              child: ExpansionTile(
                // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                title: Text(
                  "Primary",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black
                      // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                      ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("PROFIT & LOSS ACCOUNT "),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 161, 212, 254),
              child: ExpansionTile(
                // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                title: Text(
                  "Purchase Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black
                      // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                      ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("PURCHASE A/C"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 161, 212, 254),
              child: ExpansionTile(
                // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                title: Text(
                  "Sales Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black
                      // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                      ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("SALES A/C"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 161, 212, 254),
              child: ExpansionTile(
                // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                title: Text(
                  "Duties & Taxes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black
                      // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                      ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("VAT"),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("EXCISE DUTY"),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text("TDS"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const names = [
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
