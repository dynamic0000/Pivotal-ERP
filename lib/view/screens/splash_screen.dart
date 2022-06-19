import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    log("widthhh$width" "heighttt$height");

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 250,
                ),
                Container(
                  width: 420.w,
                  height: 130.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/pivotal_erp_png_logo.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 210,
                ),
                Container(
                  width: 75,
                  height: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/environment.png"),
                          fit: BoxFit.fill)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
                        // fit: BoxFit.fill
                      )),
                    ),
                    Text(
                      "Save Paper Save Tree",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
                        // fit: BoxFit.fill
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
