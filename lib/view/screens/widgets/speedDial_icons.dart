import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pivotal_erp/view/screens/new_customer_screen.dart';
import 'package:pivotal_erp/view/screens/new_sales_order.dart';

class SpeedDialIcon extends StatefulWidget {
  const SpeedDialIcon({Key? key}) : super(key: key);

  @override
  State<SpeedDialIcon> createState() => _SpeedDialIconState();
}

class _SpeedDialIconState extends State<SpeedDialIcon> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      spacing: 12,
      spaceBetweenChildren: 12,
      openCloseDial: isDialOpen,
      children: [
        SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.business,
              color: Colors.white,
            ),
            label: "New Sales Order",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewSalesOrder()));
            }),
        SpeedDialChild(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.exposure_zero_outlined,
            color: Colors.white,
          ),
          label: "Zero Sales Order",
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => SalesDashboard()));
          // }
        ),
        SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.person_add_alt_1_outlined,
              color: Colors.white,
            ),
            label: "New Customer",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewCustomerScreen()));
            }),
        SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: "My Customer"),
        SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.people_alt_outlined,
              color: Colors.white,
            ),
            label: "My Colleagues"),
        SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.location_city_outlined,
              color: Colors.white,
            ),
            label: "Live Colleagues"),
      ],
    );
  }
}
