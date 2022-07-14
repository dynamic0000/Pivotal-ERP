// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pivotal_erp/controller/remote_services.dart';
// import 'package:pivotal_erp/models/getproductdetails_model.dart';

// class Future1 extends StatefulWidget {
//   const Future1({Key? key}) : super(key: key);

//   @override
//   State<Future1> createState() => _Future1State();
// }

// class _Future1State extends State<Future1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//             onPressed: () async {
//               await RemoteService().getProductDetials();
//             },
//             icon: const Icon(Icons.abc))
//       ]),
//       body: FutureBuilder<GetProductDetails?>(
//           future: RemoteService().getProductDetials(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               log('snapsot------${snapshot.data}');
//               return const Center(child: Text('noooo'));
//             }

//             log('snapData------${snapshot.data}');

//             GetProductDetails? data = snapshot.data;
//             return Center(child: Text(data!.name));
//           }),
//     );
//   }
// }
