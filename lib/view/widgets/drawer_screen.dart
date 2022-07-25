import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/organisationdetails_screen.dart';
import 'package:pivotal_erp/view/screens/resetpassword_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      child: ListView(
        children: <Widget>[
          buildHeader(context),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Displays Dashboard",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            trailing: Icon(
              Icons.home,
              color: Colors.black,
              size: 25.sp,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserHomeScreen(bearerToken: bearerToken)));
            },
          ),
          ListTile(
            title: Text(
              'User Profile',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Displays logged in User Profile",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            trailing: Icon(
              Icons.person_rounded,
              color: Colors.black,
              size: 25.sp,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrganisationDetials()));
            },
          ),
          ListTile(
            title: Text(
              'Date Format',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "AD - BS",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            trailing: Icon(
              Icons.calendar_month,
              color: Colors.black,
              size: 25.sp,
            ),
            onTap: () {
              showDateAlertDialog(context);
            },
          ),
          ListTile(
            title: Text(
              'Change Password',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Change your password",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            trailing: Icon(
              Icons.password,
              color: Colors.black,
              size: 25.sp,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(
                            bearerToken: bearerToken,
                          )));
            },
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color.fromARGB(255, 234, 234, 234),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 108, 107, 107)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 5.r, //spread radius
                  blurRadius: 7.r, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ]),
          // padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage: const NetworkImage(
                  "https://cdn.dribbble.com/users/2364329/screenshots/10481283/050.jpg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "admin@gmail.com",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8.h,
            ),
          ]),
        ),
      );

  showDateAlertDialog(BuildContext context) {
    // set up the buttons
    Widget ADButton = ElevatedButton(
      child: const Text("AD"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget BSButton = ElevatedButton(
      child: const Text("BS"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Date Format"),
      actions: [
        ADButton,
        BSButton,
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
