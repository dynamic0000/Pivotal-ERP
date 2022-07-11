import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:searchfield/searchfield.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({Key? key}) : super(key: key);

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final province = [
    'Province No. 1',
    'Province No. 2',
    "Province No. 3",
    'Province No. 4',
    'Province No. 5',
    'Province No. 6',
    'Province No. 7'
  ];
  final district = [
    'kathmandu',
    'lalitpur',
    'Bhaktapur',
    'janakpur',
    'Solukhumbu'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          "New Customer",
          style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserHomeScreen(
                            bearerToken: '',
                          )));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.file_upload_outlined,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.verified_rounded,
                size: 28,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "PanVat No.",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Province",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),

                SearchField(
                  hint: "Select Province",
                  suggestions:
                      province.map((e) => SearchFieldListItem(e)).toList(),
                ),

                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "District",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                SearchField(
                  hint: "Select District",
                  suggestions:
                      district.map((e) => SearchFieldListItem(e)).toList(),
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: UnderlineInputBorder(),
                //   ),
                // ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Area",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Contact Person",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Contact No.",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Email ID",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                Text(
                  "Nearest Location",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                Text(
                  "Customer Type",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
