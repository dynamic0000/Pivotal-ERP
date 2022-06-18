import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pivotal_erp/screens/new_customer_screen.dart';
import 'package:pivotal_erp/screens/widgets/drawer_screen.dart';
import 'package:pivotal_erp/screens/widgets/speedDial_icons.dart';

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
        drawer: DrawerScreen(),
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
        floatingActionButton: SpeedDialIcon(),
      ),
    );
  }
}
