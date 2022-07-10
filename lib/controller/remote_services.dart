import 'dart:convert';
import 'dart:developer';

import 'package:pivotal_erp/constant.dart';
import 'package:pivotal_erp/models/autoCompleteProductList_model.dart';
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
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
  String urlList = '$urlERP/v1/account/AutoCompleteLedgerList';

  Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList(
      {String? query}) async {
    var url = Uri.parse(urlList);
    try {
      AutoCompleteLedgerListToJSON autoCompleteLedgerListToJSON =
          AutoCompleteLedgerListToJSON(
        1,
        //'sandesh',
        query ?? '',
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

  // Future<ledgerDetail?> getLedgerDetails() async {
  //   try {
  //     GetLedgerToJson details = GetLedgerToJson(2);
  //     String jsonDetails = jsonEncode(details);

  //     var uri = Uri.parse('$urlERP/v1/account/GetLedgerDetail');
  //     final responed = await http.post(uri,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Charset': 'utf-8',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer $accessToken'
  //         },
  //         body: jsonDetails);
  //     final jsonDecoded = jsonDecode(responed.body);
  //     final ledgerModel = ledgerDetail.fromJson(jsonDecoded);
  //     // log("responsedd code :${responed.statusCode}");
  //     //  log("hereeeeeeee${responed.body}");
  //     return ledgerModel;
  //     // final jsonDecoded = jsonDecode(responed.body);
  //     // log("outputtttttt$jsonDecoded");
  //   } catch (e) {
  //     log("erorr-------------- ${e.toString()}");
  //     rethrow;
  //   }
  // }

  Future<List<AutoCompleteProductList>> getAutoCompleteProductList() async {
    //Future<void> getAutoCompleteProductList() async {
    List<AutoCompleteProductList> results9 = [];
    //var data9 = [];
    var url9 = Uri.parse('$urlERP/v1/inventory/AutoCompleteProductList');
    try {
      AutoCompleteProductListToJSON autoCompleteProductListToJSON =
          AutoCompleteProductListToJSON(
        1,
        //'sandesh',
        '',
        1,
      );
      String jsonAutoCopleteProductList =
          jsonEncode(autoCompleteProductListToJSON);
      var response9 = await http.post(
        url9,
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $accessToken'
        },
        //body lai json format ma change gareko
        body: jsonAutoCopleteProductList,
      );
      log('koi$response9');
      if (response9.statusCode == 200) {
        var data9 = jsonDecode(response9.body);
        log('letsseeee-------${response9.body}');
        var results9 = data9.map((e) => AutoCompleteProductList.fromJson(e));
        return results9;
      } else {
        log("No data---fetch error");
      }
    } on Exception catch (e) {
      log('2222222error: $e');
    }
    return results9;
  }

  // Future<List<AutoCompleteProductList>?> getAutoCompleteProductList() async {
  //   try {
  //     AutoCompleteProductListToJSON autoCompleteProductListToJSON =
  //         AutoCompleteProductListToJSON(1, 'c', 1);
  //     String jsonAutoCompleteProductList =
  //         jsonEncode(autoCompleteProductListToJSON);
  //     var uri = Uri.parse('$urlERP/v1/inventory/AutoCompleteProductList');
  //     final response1 = http.post(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Charset': 'utf-8',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       body: jsonAutoCompleteProductList,
  //     );
  //     if (response1.statusCode == 200) {
  //       data = json.decode(response1.body);
  //       results1 = data.map((e) => AutoCompleteProductList.fromJson(e)).toList();
  //     }
  //   } on Exception catch (e) {
  //     log('ProductInventoryyy-------${e.toString()}');
  //   }
  //   return results1;
  // }
  // Future<List<AutoCompleteProductList>> getAutoCompleteProductList() async {
  //   //Future<void> getAutoCompleteProductList() async {
  //   List<AutoCompleteProductList> results9 = [];
  //   //var data9 = [];
  //   var url9 = Uri.parse(
  //       'https://demo.pivotalerp.app/v1/inventory/AutoCompleteProductList');
  //   try {
  //     AutoCompleteProductListToJSON autoCompleteProductListToJSON =
  //         AutoCompleteProductListToJSON(
  //       1,
  //       //'sandesh',
  //       '',
  //       1,
  //     );
  //     String jsonAutoCopleteProductList =
  //         jsonEncode(autoCompleteProductListToJSON);
  //     var response9 = await http.post(
  //       url9,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Charset': 'utf-8',
  //         'Accept': 'application/json',
  //         // 'Content-Type': 'application/x-www-form-urlencoded',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       //body lai json format ma change gareko
  //       body: jsonAutoCopleteProductList,
  //     );
  //     log('koi$response9');
  //     if (response9.statusCode == 200) {
  //       var data9 = jsonDecode(response9.body);
  //       log('letsseeee-------${response9.body}');
  //       var results9 = data9.map((e) => AutoCompleteProductList.fromJson(e));
  //       return results9;
  //     } else {
  //       log("No data---fetch error");
  //     }
  //   } on Exception catch (e) {
  //     log('2222222error: $e');
  //   }
  //   return results9;
  // }
}
