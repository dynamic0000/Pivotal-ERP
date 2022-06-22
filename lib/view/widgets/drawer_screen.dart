import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 200.h,
          ),
          buildHeader(context),
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
              color: const Color.fromARGB(255, 173, 206, 232),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ]),
          // padding: const EdgeInsets.only(top: 10),
          child: Column(children: const [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(onPressed: (() {}), icon: const Icon(Icons.edit)),
            //   ],
            // ),

            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/2364329/screenshots/10481283/050.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "admin@gmail.com",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "9876543210",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Company Name: Dynamic Technosoft",
              style: TextStyle(
                  fontSize: 16,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            // SizedBox(
            //   height: 8,
            // ),
          ]),
        ),
      );
}
