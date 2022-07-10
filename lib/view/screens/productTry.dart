// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:pivotal_erp/controller/remote_services.dart';
// import 'package:pivotal_erp/models/autoCompleteProductList_model.dart';

// class ProductTry extends StatefulWidget {
//   const ProductTry({Key? key}) : super(key: key);

//   @override
//   State<ProductTry> createState() => _ProductTryState();
// }

// class _ProductTryState extends State<ProductTry> {
//   // String query = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 70,
//           ),
//           TypeAheadField<AutoCompleteProductList?>(
//             textFieldConfiguration: const TextFieldConfiguration(
//                 decoration: InputDecoration(hintText: "Select Product")),

//             suggestionsCallback: (pattern) async {
//               return await RemoteService().getAutoCompleteProductList();
//             },
//             // RemoteService().getAutoCompleteProductList(query);
//             itemBuilder: (context, AutoCompleteProductList? suggestion) {
//               final products = suggestion!;
//               log("products----------$products");
//               final names = products.name.toString();
//               log("names--------------$names");
//               return ListTile(
//                 title: Text(names),
//               );
//             },
//             noItemsFoundBuilder: (context) => const Center(
//               child: Text(
//                 "No products found",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             onSuggestionSelected: (AutoCompleteProductList? suggestion) {
//               final products = suggestion!;
//               final names = products.name.toString();
//               ScaffoldMessenger.of(context)
//                 ..removeCurrentSnackBar()
//                 ..showSnackBar(
//                     SnackBar(content: Text('Selected Product: $names')));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
