import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pivotal_erp/screens/new_customer_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                ),
                Text("This is the dashboard of type user"),
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
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
                onTap: () {}),
            SpeedDialChild(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.exposure_zero_outlined,
                  color: Colors.white,
                ),
                label: "Zero Sales Order"),
            SpeedDialChild(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.white,
                ),
                label: "New Customer",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewCustomerScreen()));
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
        ),
      ),
    );
  }
}
