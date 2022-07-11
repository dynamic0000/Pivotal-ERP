import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pivotal_erp/view/screens/User_home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 150), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  UserHomeScreen(bearerToken: widget.bearerToken,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 96, 173, 237),
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
