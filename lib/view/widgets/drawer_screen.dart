import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          const ListTile(
            title: Text("Options 1"),
          ),
          SizedBox(
            height: 10.h,
          ),
          const ListTile(
            title: Text("Options 2"),
          ),
          SizedBox(
            height: 10.h,
          ),
          const ListTile(
            title: Text("Options 3"),
          ),
          SizedBox(
            height: 10.h,
          ),
          const ListTile(
            title: Text("Options 4"),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
