import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/select_customer.dart';

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
            // debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            //home: const OrganisationDetials(),
            // home: const UserHomeScreen(),
            // home: const LoginScreen(),
            //   home: const NewSalesOrder(),
            // home: SelectCustomer(),
            // home: const NewSalesOrder(),
            home: const SelectCustomer(),
            //home: const SelectCustomer(),
          );
        });
  }
}
// import 'dart:developer';

// import 'package:collection/collection.dart';

// var list = [
//   {
//     "10/01/2019": [
//       {"title": "Avengers"},
//       {"title": "Creed"}
//   },
//   {
//     "30/10/2019": [
//       {"title": "Jumanji"}
//     ]
//   }
// ];

// void main(List<String> args) {
//   var data = [
//     {"title": 'Avengers', "release_date": '10/01/2019'},
//     {"title": 'Creed', "release_date": '10/01/2019'},
//     {"title": 'Jumanji', "release_date": '30/10/2019'},
//   ];

//   var newMap = groupBy(data, (Map obj) => obj['release_date']);
//   log('mapppppppppppp==========$newMap');
//   print('ppppppp' '$newMap');
//   var newMap1 = groupBy(data, (Map obj) => obj['release_date'])
//       .map((k, v) => MapEntry(k, v.map((item) {
//             item.remove('release_date');
//             return item;
//           })));
// }
