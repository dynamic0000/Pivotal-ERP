import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/autocompleteproductList_model.dart';

class Future1 extends StatefulWidget {
  const Future1({Key? key}) : super(key: key);

  @override
  State<Future1> createState() => _Future1State();
}

class _Future1State extends State<Future1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AutoCompleteProductList?>>(
        future: RemoteService().getAutoCompleteProductList(''),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            log('snapsot------${snapshot.data}');
            return const Center(child: Text('noooo'));
          }

          log('snapData------${snapshot.data}');

          List<AutoCompleteProductList?>? data = snapshot.data;
          return Text(data![0]!.name);
        });
  }
}
