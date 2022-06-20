import 'dart:async';

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
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // log("widthhh$width" "heighttt$height");

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
                SizedBox(
                  height: 220.h,
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
                SizedBox(
                  height: 210.h,
                ),
                Container(
                  width: 75.w,
                  height: 70.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/environment.png"),
                          fit: BoxFit.fill)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 35.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
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
                      height: 70.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
                      )),
                    ),
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
