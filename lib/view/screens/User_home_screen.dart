import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pivotal_erp/view/screens/login_screen.dart';
import 'package:pivotal_erp/view/widgets/drawer_screen.dart';
import 'package:pivotal_erp/view/widgets/speedDial_icons.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;
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
          title: const Text("Dashboard"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showLogOutAlertDialog(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        drawer: DrawerScreen(
          bearerToken: widget.bearerToken,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Text(
                  "Sales Order",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                salesRow(context, 'images/today.png', 'Today', '4 orders',
                    'Yesterday', '0 order'),
                SizedBox(
                  height: 15.h,
                ),
                salesRow(context, 'images/week.png', 'This Week', '5 orders',
                    'Last Week', '1 order'),
                SizedBox(
                  height: 15.h,
                ),
                salesRow(context, 'images/month.png', 'This Month', '4 orders',
                    'Last Month', '0 order'),
                SizedBox(
                  height: 15.h,
                ),
                salesRow(context, 'images/year.png', 'This Year', '8 orders',
                    'Last Order', '0 order'),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDialIcon(
          bearerToken: widget.bearerToken,
        ),
      ),
    );
  }

  Container salesRow(BuildContext context, String photo, String latestTime,
      String latestOrder, String previousTime, String previousOrder) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1.0.w),
          color: const Color.fromARGB(255, 255, 253, 253),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2.r, //spread radius
              blurRadius: 2.r, // blur radius
              offset: const Offset(0, 2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //images
            Row(
              children: [
                Container(
                  height: 80.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(photo), fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        latestTime,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Text(
                        latestOrder,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      previousTime,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      previousOrder,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: 40.sp,
                      color: Colors.green,
                    )
                  ],
                )
              ],
            ),
            //arrowwwww
          ],
        ),
      ),
    );
  }

  showLogOutAlertDialog(BuildContext context) {
    // set up the buttons
    Widget noButton = ElevatedButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yesButton = ElevatedButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoginScreen())));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Are you sure you want to logout?"),
      actions: [
        yesButton,
        noButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
