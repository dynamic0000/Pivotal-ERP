import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ListTile(
            title: Text("Options 1"),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Options 2"),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Options 3"),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Options 4"),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
