import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Customer",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserHomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 28,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.file_upload_outlined,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
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
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "PanVat No.",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Province",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                // DropdownButton(
                //   province : province.map(buildMenuItem).toList(),

                // ),

                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "District",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Area",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Contact Person",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Contact No.",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Email ID",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                Text(
                  "Nearest Location",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                Text(
                  "Customer Type",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 21, 115, 193),
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
