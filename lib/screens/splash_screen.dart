import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/screens/User_home_screen.dart';

import 'package:pivotal_erp/screens/sales_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserHomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
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
                  height: 250,
                ),
                Container(
                  width: 420,
                  height: 130,
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
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
                        // fit: BoxFit.fill
                      )),
                    ),
                    Text(
                      "Save Paper Save Tree",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/line_13.png"),
                        // fit: BoxFit.fill
                      )),
                    ),
                    SizedBox(
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
