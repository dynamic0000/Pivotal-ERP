import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pivotal_erp/view/screens/widgets/drawer_screen.dart';
import 'package:pivotal_erp/view/screens/widgets/speedDial_icons.dart';

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
          title: const Text("Dashboard"),
          centerTitle: true,
        ),
        drawer: const DrawerScreen(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60.w,
                  ),
                  const Text(
                    "Sales",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                  salesRow(context, 'images/month.png', 'This Month',
                      '4 orders', 'Last Month', '0 order'),
                  SizedBox(
                    height: 15.h,
                  ),
                  salesRow(context, 'images/year.png', 'This Year', '8 orders',
                      'Last Order', '0 order'),

                  /////////second
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        // body: Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Column(
        //       // crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Align(
        //           alignment: Alignment.center,
        //         ),
        //         Text("This is the dashboard of type user"),
        //       ],
        //     ),
        //   ),
        // ),
        floatingActionButton: const SpeedDialIcon(),
      ),
    );
  }

  Container salesRow(BuildContext context, String photo, String latestTime,
      String latestOrder, String previousTime, String previousOrder) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1.0),
          color: const Color.fromARGB(255, 255, 253, 253),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2, //spread radius
              blurRadius: 2, // blur radius
              offset: const Offset(0, 2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //images
              Container(
                height: 80,
                width: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(photo), fit: BoxFit.fill)),
              ),
              //today
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      latestTime,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      latestOrder,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              const SizedBox(
                  // width: 68,
                  ),
              //yesterday
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    previousTime,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    previousOrder,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              //arrowwwww
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_upward,
                    size: 40,
                    color: Colors.green,
                  )
                ],
              )
              // Container(
              //   height: 50,
              //   width: 40,
              //   child: Icon(
              //     Icons.arrow_upward,
              //     size: 50,
              //     color: Colors.green,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
