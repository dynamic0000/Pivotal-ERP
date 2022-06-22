import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 150), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserHomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 110, 181, 239),
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
          // strokeWidth: 5.0,
        )
            // SpinKitRing(
            //   color: Colors.white,
            //   size: 50.0,
            // ),
            ),
      ),
    );
  }
}
