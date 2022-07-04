import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';

class ExpansionTileScreen extends StatefulWidget {
  const ExpansionTileScreen({Key? key}) : super(key: key);

  @override
  State<ExpansionTileScreen> createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  AutoCompleteLedgerList? aCLL;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: ListTile(
                  title: Text(aCLL!.address ?? ''),
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
    );
  }
}
