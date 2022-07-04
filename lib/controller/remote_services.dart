import 'dart:convert';
import 'dart:developer';

import 'package:pivotal_erp/constant.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/models/ledgerDetail.dart';
import 'package:pivotal_erp/models/resetpassword_model.dart';
import 'package:pivotal_erp/models/token_model.dart';
import 'package:http/http.dart' as http;

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
        log('resssssssssssssssssssssss$response');
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
      log('jjjjjjjjjjjjjjjjjj$jsonUser');
      //var uri = Uri.parse('$urlERP/v1/General/UpdatePwd');
      var uri = Uri.parse('https://demo.pivotalerp.app/v1/General/UpdatePwd');
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Charset': 'utf-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
          body: jsonUser);

      log("response code:${response.statusCode}");
      log('newwwwwwwwwwwwwwwwww${response.body}');
      final jsonDecoded = jsonDecode(response.body);
      log('updateeeeeeeeeeeeeeeeeeee$jsonDecoded');
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
      log("responsedd code :${responed.statusCode}");
      log("hereeeeeeee${responed.body}");
      return ledgerModel;
      // final jsonDecoded = jsonDecode(responed.body);
      // log("outputtttttt$jsonDecoded");
    } catch (e) {
      log("erorr-------------- ${e.toString()}");
      rethrow;
    }
  }

// Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList() async {
  Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList() async {
    try {
      AutoCompleteLedgerListToJSON autoCompleteLedgerListToJSON =
          AutoCompleteLedgerListToJSON(
        1,
        's',
        1,
      );
      String jsonAutoCopleteLedgerList =
          jsonEncode(autoCompleteLedgerListToJSON);
      var uri = Uri.parse('$urlERP/v1/account/AutoCompleteLedgerList');

      final response = await http.post(
        uri,
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
      ////////////////////////////////actual////////////////
      final jsonDecoded = jsonDecode(response.body);
      final ledgerModel = AutoCompleteLedgerList.fromJson(jsonDecoded);
      log("jsonDecoded-------------$jsonDecoded");
      log("jsonLedgerModel----------$ledgerModel");
      return jsonDecoded;
      ////////////////////////////////actual////////////////

      // String arrayObjsText = '{"tags":${response.body} }';
      // var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
      // log('taggJsonnn$tagObjsJson');

      // List<AutoCompleteLedgerList> tagObjs = tagObjsJson
      //     .map((tagJson) => AutoCompleteLedgerList.fromJson(tagJson))
      //     .toList();
      // return tagObjs;
    } catch (e) {
      log('ERORRRRRRRRRR$e');
      rethrow;
    }
  }
}
