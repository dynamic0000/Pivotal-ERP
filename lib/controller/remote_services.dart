import 'dart:convert';
import 'dart:developer';

import 'package:pivotal_erp/constant.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/models/ledgerDetail.dart';
//import 'package:pivotal_erp/models/resetpassword_model.dart';
import 'package:pivotal_erp/models/token_model.dart';
import 'package:http/http.dart' as http;

import '../models/resetpassword_model.dart';
//import 'package:pivotal_erp/models/resetpassword_model.dart';

//import '../models/autocompleteledgerlist_model.dart';

class RemoteService {
  Future<TokenModel?> getToken(String userName, String password) async {
    try {
      var uri = Uri.parse('$urlERP/v1//token');
      final response = await http.post(uri, body: {
        "userName": userName,
        "password": password,
        // "userName": 'admin',
        // "password": 'admin',
        "grant_type": 'password'
      });
      final jsonDecoded = jsonDecode(response.body);
      final tokenModel = TokenModel.fromMap(jsonDecoded);
      //log('httppppppppp$tokenModel');
      if (response.statusCode == 200) {
        // log('resssssssssssssssssssssss$response');
        return tokenModel;
      }
      print('sad');
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response?> updatePassword(String oldPWD, String newPWD) async {
    try {
      User user = User(oldPWD, newPWD);

      String jsonUser = jsonEncode(user);
      // log('jjjjjjjjjjjjjjjjjj$jsonUser');
      var uri = Uri.parse('$urlERP/v1/General/UpdatePwd');
      // var uri = Uri.parse('https://demo.pivotalerp.app/v1/General/UpdatePwd');
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Charset': 'utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
          body: jsonUser);

      //  log("response code:${response.statusCode}");
      //   log('newwwwwwwwwwwwwwwwww ${response.body}');
      final jsonDecoded = jsonDecode(response.body);
      //  log('updateeeeeeeeeeeeeeeeeeee$jsonDecoded');
    } catch (e) {
      // log('errorrrrrrrr${e.toString()}');
      rethrow;
    }
    return null;
  }

  Future<String> getUrl(String url) async {
    try {
      var uri = Uri.parse(url);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return "Success";
      }
      return 'Failed';
    } catch (e) {
      return " Failed:";
    }
  }

  var data = [];
  List<AutoCompleteLedgerList> results = [];
  String urlList =
      'https://demo.pivotalerp.app/v1/account/AutoCompleteLedgerList';

  Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList(
      {String? query}) async {
    var url = Uri.parse(urlList);
    try {
      AutoCompleteLedgerListToJSON autoCompleteLedgerListToJSON =
          AutoCompleteLedgerListToJSON(
        1,
     //'sandesh',
        query??'',
        1,
      );
      String jsonAutoCopleteLedgerList =
          jsonEncode(autoCompleteLedgerListToJSON);
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $accessToken'
        },
        //body lai json format ma change gareko
        body: jsonAutoCopleteLedgerList,
      );
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => AutoCompleteLedgerList.fromJson(e)).toList();
        if (query != null) {
          results = results.toList();
        }
      } else {
        log("fetch error");
      }
    } on Exception catch (e) {
      log('error: $e');
    }
    return results;
  }

  // Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList() async {
  //   // Future<AutoCompleteLedgerList> getAutoCompleteLedgerList() async {
  //   try {
  //     AutoCompleteLedgerListToJSON autoCompleteLedgerListToJSON =
  //         AutoCompleteLedgerListToJSON(
  //       1,
  //       's',
  //       1,
  //     );
  //     String jsonAutoCopleteLedgerList =
  //         jsonEncode(autoCompleteLedgerListToJSON);
  //     var uri = Uri.parse(
  //         'https://demo.pivotalerp.app/v1/account/AutoCompleteLedgerList');
  //     final response = await http.post(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Charset': 'utf-8',
  //         'Accept': 'application/json',
  //         // 'Content-Type': 'application/x-www-form-urlencoded',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       //body lai json format ma change gareko
  //       body: jsonAutoCopleteLedgerList,
  //     );
  //     ////////////////////////////////actual////////////////
  //     // List jsonDecoded = jsonDecode(response.body);
  //     // //final ledgerModel = AutoCompleteLedgerList.fromJson(jsonDecoded)  ;
  //     // final ledgerModel = jsonDecoded
  //     //     .map((job) => AutoCompleteLedgerList.fromJson(job))
  //     //     .toList();
  //     // return ledgerModel;
  //     ////////////////////////////////actual////////////////

  //     String arrayObjsText = '{"tags":${response.body} }';
  //     var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
  //     log('taggJsonnn$tagObjsJson');

  //     List<AutoCompleteLedgerList> tagObjs = tagObjsJson
  //         .map((tagJson) => AutoCompleteLedgerList.fromJson(tagJson))
  //         .toList();
  //     return tagObjs;
  //   } catch (e) {
  //     log('ERORRRRRRRRRR$e');
  //     rethrow;
  //   }
  // }

  // Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerListKey(
  //     String keyword) async {
  //   // Future<AutoCompleteLedgerList> getAutoCompleteLedgerList() async {
  //   try {
  //     AutoCompleteLedgerListToJSON autoCompleteLedgerListToJSON =
  //         AutoCompleteLedgerListToJSON(
  //       1,
  //       keyword,
  //       1,
  //     );
  //     String jsonAutoCopleteLedgerList =
  //         jsonEncode(autoCompleteLedgerListToJSON);
  //     var uri = Uri.parse(
  //         'https://demo.pivotalerp.app/v1/account/AutoCompleteLedgerList');
  //     final response = await http.post(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Charset': 'utf-8',
  //         'Accept': 'application/json',
  //         // 'Content-Type': 'application/x-www-form-urlencoded',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       //body lai json format ma change gareko
  //       body: jsonAutoCopleteLedgerList,
  //     );
  //     ////////////////////////////////actual////////////////
  //     // List jsonDecoded = jsonDecode(response.body);
  //     // //final ledgerModel = AutoCompleteLedgerList.fromJson(jsonDecoded)  ;
  //     // final ledgerModel = jsonDecoded
  //     //     .map((job) => AutoCompleteLedgerList.fromJson(job))
  //     //     .toList();
  //     // return ledgerModel;
  //     ////////////////////////////////actual////////////////

  //     String arrayObjsText = '{"tags":${response.body} }';
  //     var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
  //     log('taggJsonnn$tagObjsJson');

  //     List<AutoCompleteLedgerList> tagObjs = tagObjsJson
  //         .map((tagJson) => AutoCompleteLedgerList.fromJson(tagJson))
  //         .toList();
  //     return tagObjs;
  //   } catch (e) {
  //     log('ERORRRRRRRRRR$e');
  //     rethrow;
  //   }
  // }

  Future<ledgerDetail?> getLedgerDetails() async {
    try {
      GetLedgerToJson details = GetLedgerToJson(2);
      String jsonDetails = jsonEncode(details);

      var uri = Uri.parse('$urlERP/v1/account/GetLedgerDetail');
      final responed = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Charset': 'utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
          body: jsonDetails);
      final jsonDecoded = jsonDecode(responed.body);
      final ledgerModel = ledgerDetail.fromJson(jsonDecoded);
      // log("responsedd code :${responed.statusCode}");
      //  log("hereeeeeeee${responed.body}");
      return ledgerModel;
      // final jsonDecoded = jsonDecode(responed.body);
      // log("outputtttttt$jsonDecoded");
    } catch (e) {
      log("erorr-------------- ${e.toString()}");
      rethrow;
    }
  }
}
