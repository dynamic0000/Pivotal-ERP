import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/resetpassword_screen.dart';

// const bool debugEnableDevicesSimulator = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your appliciation.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            //home: const OrganisationDetials(),
            home: const ResetPasswordScreen(),
            // home: const LoginScreen(),
            // home: SalesDashboard(),

            // home: SelectCustomer(),
            // home: const NewSalesOrder(),
          );
        });
  }
}
