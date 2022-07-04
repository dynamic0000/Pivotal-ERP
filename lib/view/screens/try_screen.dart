import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/controller/remote_services.dart';

import '../../models/autocompleteledgerlist_model.dart';

class TryScreen extends StatefulWidget {
  const TryScreen({Key? key}) : super(key: key);

  @override
  State<TryScreen> createState() => _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
  AutoCompleteLedgerList? s;

  @override
  Widget build(
    BuildContext context,
  ) {
    //final AutoCompleteLedgerList? acll;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () async {
              await RemoteService().getAutoCompleteLedgerList();
            },
            icon: const Icon(Icons.abc))
      ]),
      body: FutureBuilder(
          future: RemoteService().getAutoCompleteLedgerList(),
          builder: (
            context,
            AsyncSnapshot<List<AutoCompleteLedgerList?>> snapshot,
          ) {
            final ledgerList = snapshot.data;

            if (ledgerList != null) {
              log('dddddddd-------------$ledgerList');
              Text(ledgerList[0]!.creditLimitAmount.toString());
              for (var el in ledgerList) {
                log('ledgerid${el?.ledgerId}');
                //   log('ledgerNameeeeee${element.name}');
                return Center(child: Text(ledgerList[1]!.name.toString()));
              }
              return const Center(child: Text('ledgerList'));
            } else {
              return const Center(child: Text('hurray'));
            }
          }),
    );

    // Scaffold(
    //     appBar: AppBar(actions: [
    //       IconButton(
    //         icon: const Icon(Icons.abc),
    //         onPressed: () async {
    //           final result = await RemoteService().getAutoCompleteLedgerList();
    //           // for (var element in result) {
    //           //   log('ledgerid${element.ledgerId}');
    //           //   log('ledgerNameeeeee${element.name}');
    //           // }
    //         },
    //       )
    //     ]),
    //     body: const Text('ss'));
  }
}
