import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/organisationdetails_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      child: ListView(
        children: <Widget>[
          // SizedBox(
          //   height: 200.h,
          // ),
          buildHeader(context),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Displays Dashboard",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: const Icon(
              Icons.home,
              color: Colors.black,
              size: 25,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserHomeScreen()));
            },
          ),
          ListTile(
            title: const Text(
              'User Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Displays logged in User Profile",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: const Icon(
              Icons.person_rounded,
              color: Colors.black,
              size: 25,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrganisationDetials()));
            },
          ),
          ListTile(
            title: const Text(
              'Date Format',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "AD - BS",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: const Icon(
              Icons.calendar_month,
              color: Colors.black,
              size: 25,
            ),
            onTap: () {
              showDateAlertDialog(context);
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
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 234, 234, 234),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 108, 107, 107)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ]),
          // padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // IconButton(
                //     onPressed: (() {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   const OrganisationDetials()));
                //     }),
                //     icon: const Icon(Icons.edit)),
              ],
            ),

            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/2364329/screenshots/10481283/050.jpg"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Admin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "admin@gmail.com",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            // const Text(
            //   "9876543210",
            //   style: TextStyle(
            //       fontSize: 16,
            //       fontStyle: FontStyle.italic,
            //       fontWeight: FontWeight.normal),
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // const Text(
            //   "Company Name: Dynamic Technosoft",
            //   style: TextStyle(
            //       fontSize: 16,
            //       // fontStyle: FontStyle.italic,
            //       fontWeight: FontWeight.normal),
            // ),
            // SizedBox(
            //   height: 8,
            // ),
          ]),
        ),
      );

  showDateAlertDialog(BuildContext context) {
    // set up the buttons
    Widget ADButton = FlatButton(
      child: const Text("AD"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget BSButton = FlatButton(
      child: const Text("BS"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Date Format"),
      // content: Text(
      //     "Would you like to continue learning how to use Flutter alerts?"),
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
