import 'package:flutter/material.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';

import 'package:pivotal_erp/view/screens/sales_dashboard.dart';
import 'package:pivotal_erp/view/screens/select_customer.dart';
import 'package:pivotal_erp/view/screens/splash_screen.dart';
import 'package:pivotal_erp/view/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SalesDashboard(),
      home: SplashScreen(),
      // home: SelectCustomer(),
    );
  }
}
