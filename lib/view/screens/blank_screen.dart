import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/models/ledgerDetail.dart';

class blankScreen extends StatefulWidget {
  const blankScreen({Key? key}) : super(key: key);

  @override
  State<blankScreen> createState() => _blankScreenState();
}

class _blankScreenState extends State<blankScreen> {
  ledgerDetail? ledgerDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: Center(
      // child: Text(ledgerDetails!.ledgerId.toString()),

      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () async {
      //       final out = await RemoteService().getLedgerDetails();
      //       log("output----------$out");
      //     },
      //     child: const Text("Press here"),
      //   ),
      //   // child: Text(ledgerDetails!.ledgerId.toString()),
      //   // final output = await RemoteService().getLedgerDetails();
      //   // for (var element in output) {
      //   //   log('ledgerId-----------${element!.ledgerId.toString()}');
      //   // // log("weheeeeeeee122");
      //   // RemoteService().getLedgerDetails();
      // ),

      body: FutureBuilder(
          future: RemoteService().getLedgerDetails(),
          builder: (context, AsyncSnapshot<ledgerDetail?> snapshot) {
            final ledgerList = snapshot.data;
            log('ledgerListyooooooo-----$ledgerList');
            if (ledgerList != null) {
              return Center(
                child: ListTile(
                  title: Text(
                    ledgerList.ledgerId.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    ledgerList.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),

                // child: Text(ledgerList.name.toString())
              );
            } else {
              return const Center(child: Text('hurray'));
            }
          }),
    );
  }
}
