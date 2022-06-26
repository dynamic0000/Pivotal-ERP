import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pivotal_erp/view/screens/live_customer.dart';
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
                      builder: (context) => const NewSalesOrder()));
            }),
        SpeedDialChild(
          backgroundColor: const Color.fromARGB(255, 136, 236, 140),
          child: const Icon(
            Icons.exposure_zero_outlined,
            color: Colors.black,
          ),
          label: "Zero Sales Order",
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => SalesDashboard()));
          // }
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
                  MaterialPageRoute(builder: (context) => MapSample()));
            }),
      ],
    );
  }
}
