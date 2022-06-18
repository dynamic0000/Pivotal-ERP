import 'package:flutter/material.dart';
import 'package:pivotal_erp/screens/new_sales_order.dart';
import 'package:pivotal_erp/screens/widgets/my_search_delegate.dart';

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
        title: Text("Select Customer"),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewSalesOrder()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 161, 212, 254),
                child: ExpansionTile(
                  // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    "Cash-in-hand",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("CASH"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 161, 212, 254),
                child: ExpansionTile(
                  // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    "Primary",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("PROFIT & LOSS ACCOUNT "),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 161, 212, 254),
                child: ExpansionTile(
                  // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    "Purchase Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("PURCHASE A/C"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 161, 212, 254),
                child: ExpansionTile(
                  // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    "Sales Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("SALES A/C"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 161, 212, 254),
                child: ExpansionTile(
                  // backgroundColor: Color.fromARGB(255, 157, 207, 247),
                  title: Text(
                    "Duties & Taxes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                        // backgroundColor: Color.fromARGB(255, 154, 203, 242)
                        ),
                  ),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("VAT"),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("EXCISE DUTY"),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text("TDS"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
