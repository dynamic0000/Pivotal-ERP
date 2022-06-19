import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pivotal_erp/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your appliciation.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.7, 759.2),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: SalesDashboard(),
            home: const SplashScreen(),
            // home: SelectCustomer(),
          );
        });
  }
}
