import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:pivotal_erp/view/screens/live_customer.dart';
import 'package:pivotal_erp/view/screens/new_customer_screen.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';
import 'package:searchfield/searchfield.dart';

class SpeedDialIcon extends StatefulWidget {
  const SpeedDialIcon({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;
  @override
  State<SpeedDialIcon> createState() => _SpeedDialIconState();
}

class _SpeedDialIconState extends State<SpeedDialIcon> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      foregroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 136, 236, 140),
      spacing: 12,
      spaceBetweenChildren: 12,
      openCloseDial: isDialOpen,
      overlayColor: const Color.fromARGB(255, 194, 194, 194),
      overlayOpacity: 0.95,
      children: [
        SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 136, 236, 140),
            child: const Icon(
              Icons.business,
              color: Colors.black,
            ),
            label: "New Sales Order",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewSalesOrder(
                            bearerToken: widget.bearerToken,
                            indexGetter: null,
                          )));
              showVoucherDialog(context);
            }),
        SpeedDialChild(
          backgroundColor: const Color.fromARGB(255, 136, 236, 140),
          child: const Icon(
            Icons.exposure_zero_outlined,
            color: Colors.black,
          ),
          label: "Zero Sales Order",
        ),
        SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 136, 236, 140),
            child: const Icon(
              Icons.person_add_alt_1_rounded,
              color: Colors.black,
            ),
            label: "New Customer",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewCustomerScreen()));
            }),
        SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 136, 236, 140),
            child: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: "My Customer"),
        SpeedDialChild(
          backgroundColor: const Color.fromARGB(255, 136, 236, 140),
          child: const Icon(
            Icons.people_rounded,
            color: Colors.black,
          ),
          label: "My Colleagues",
          // labelStyle: TextTheme(fonn)
        ),
        SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 136, 236, 140),
            child: const Icon(
              Icons.location_pin,
              color: Colors.black,
            ),
            label: "Live Colleagues",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MapSample()));
            }),
      ],
    );
  }

  showVoucherDialog(BuildContext context) {
    AlertDialog voucher = AlertDialog(
      //actionsAlignment: MainAxisAlignment.start,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
          ],
        )
      ],
      title: const Text('Voucher Mode'),
      content: Column(
        children: [
          SearchField(
            suggestions: const [],
            hint: "Search",
          ),
          SizedBox(
            height: 300.0, // Change as per your requirement
            width: 300.0,
            child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listItems[index]),
                    onTap: () {
                      log("${listItems[index]} is pressed");
                    },
                  );
                }),
          )
        ],
      ),
    );
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return voucher;
        });
  }
}

const List<String> listItems = ['a', 'b', 'c', 'd', 'e', 'f', 't', 'h'];
