import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:intl/intl.dart';
import 'package:pivotal_erp/constant.dart';
import 'package:dio/dio.dart';
//
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/models/autocompleteproductList_model.dart';
import 'package:pivotal_erp/models/getproductdetails_model.dart';
import 'package:pivotal_erp/models/getvouchermodes_model.dart';
import 'package:pivotal_erp/models/getvoucherno_model.dart';
import 'package:pivotal_erp/models/savesalesinvoice_model.dart';
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

  Future<http.Response?> updatePassword(
      String oldPWD, String newPWD, String dynamicToken) async {
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
            'Authorization': 'Bearer $dynamicToken'
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

  Future<List<AutoCompleteLedgerList>> getAutoCompleteLedgerList(
      {String? query, required String? bearerTokenDynamic}) async {
    var data = [];
    List<AutoCompleteLedgerList> results = [];
    String urlList = '$urlERP/v1/account/AutoCompleteLedgerList';
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
          'Authorization': 'Bearer $bearerTokenDynamic'
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

  Future<List<AutoCompleteProductList>> getAutoCompleteProductList(
      String query, String dynamicToken) async {
    //Future<void> getAutoCompleteProductList() async {
    List<AutoCompleteProductList> productLists = [];
    //var data9 = [];
    var url = Uri.parse('$urlERP/v1/inventory/AutoCompleteProductList');
    try {
      AutoCompleteProductListToJSON autoCompleteProductListToJSON =
          AutoCompleteProductListToJSON(
        1,
        //'sandesh',
        query,
        1,
      );

      String jsonAutoCopleteProductList =
          jsonEncode(autoCompleteProductListToJSON);
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $access'
        },
        //body lai json format ma change gareko
        body: jsonAutoCopleteProductList,
      );
      // log('koi${response.body}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // resultss =
        //     data9.map((e) => AutoCompleteProductList.fromJson(e)).toList();
        // log('productLists$resultss');
        return [
          ...data.map((e) => AutoCompleteProductList.fromJson(e)).toList()
        ];
      } else {
        log("No data---fetch error");
      }
    } on Exception catch (e) {
      log('error-------: $e');
    }
    // log('final' '$results9');
    return productLists;
  }

  Future<GetProductDetails?> getProductDetials(int productIdIndex) async {
    var url =
        Uri.parse('https://demo.pivotalerp.app/v1/inventory/GetProductDetail');
    try {
      GetProductDetialsToJSON getProductDetialsToJSON =
          GetProductDetialsToJSON(productIdIndex);
      log('contAPIIIII-____$productIdIndex');
      String jsonGetProductDetials = jsonEncode(getProductDetialsToJSON);
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $access',
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonGetProductDetials,
      );

      if (response.statusCode == 200) {
        // log('aaaaaaaaa');
        var data = jsonDecode(response.body);
        final productModel = GetProductDetails.fromMap(data);
        //   log('productdetails-----$data');
        return productModel;
      }
      //log('errrorr11111');
    } catch (e) {
      log('getProductDetialerrorrrr----${e.toString()};');
      rethrow;
    }
    return null;
  }

  Future<GetVoucherNo?> getVoucherNo() async {
    var url = Uri.parse('https://demo.pivotalerp.app/v1/General/GetVoucherNo');
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      log('formatted-------$formattedDate');

      GetVoucherNoToJSON getVoucherNoToJSON =
          GetVoucherNoToJSON(0, formattedDate, 13);

      String jsonGetVoucherNo = jsonEncode(getVoucherNoToJSON);
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $access',
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonGetVoucherNo,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final voucherNo = GetVoucherNo.fromMap(data);
        log('VoucherNoooooo-----${voucherNo.toJson()}');
        return voucherNo;
      }
      //log('errrorr11111');
    } catch (e) {
      log('getVOucherNoooerrorrrr----${e.toString()};');
      rethrow;
    }
    return null;
  }

  ////////////////////////////////////////////////////////////////////
  Future<List<GetVoucherModes>?> getVoucherModes() async {
    List<GetVoucherModes> voucherModes = [];

    var url = Uri.parse('$urlERP/v1/Account/GetVoucherModes?VoucherType=13');
    try {
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $access',
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );

      if (response.statusCode == 200) {
        log('satatuscode-------${response.statusCode}');
        var data = jsonDecode(response.body);

        // var voucherModes =
        //   [...data.map((e) => GetVoucherModes.fromJson(e)).toList()];

        log('VoucherMOdessssss-------$voucherModes');

        return [...data.map((e) => GetVoucherModes.fromJson(e)).toList()];
      } else {
        log("No data---fetch error");
      }
    } catch (e) {
      log('eeeeeeeeeeeeeeee_________${e.toString()}');
    }
    // log('final' '$results9');
    return voucherModes;
  }

  Future<SaveSalesInvoice?> saveSalesInvoice({
    int? voucherId,
    int? quantity,
    double? amount,
    int? billedQuantity,
    double? disAmt,
    double? disPer,
    int? ledgerId,
    int? productId,
    double? rate,
    int? unitId,
    int? partyledgerId,
    double? totalAmount,
    String? voucherDate,
  }) async {
    var url =
        'https://demo.pivotalerp.app/v1/Inventory/SaveSalesInvoice';
    SaveSalesInvoice? saveOn;
    try {
      Dio dio = Dio();

      log('tryinggggggggg');
      var response = await dio.put(
        url,
        headers: {
          'Authorization': 'Bearer $access',
          'Content-Type': 'application/form-data',
          // 'Charset': 'utf-8',
          // 'Accept': 'application/json',
        },
        body: {
          "aditionalCostColl": '${[]}',
          "itemAllocationColl": '${[
            {
              "ActualQty": 1,
              "Amount": 1,
              "BilledQty": 1,
              "DiscountAmt": 1,
              "DiscountPer": 1,
              "FreeQty": 13,
              "LedgerId": 0,
              "ProductId": 0,
              "Rate": 1,
              "UnitId": 1
            }
          ]}',
          "manualVoucherNO": "1",
          "narration": "",
          // "partyLedgerId": 1,
          "refNo": "",
          // "totalAmount": 1,
          "voucherDate": '2022-07-20',
          // "voucherId": 1
        },
      );
      var data = response.body;
      log('savaDataatatatatata-----$data');
      if (response.statusCode == 200) {
        log('saveresponsecose---------${response.statusCode}');
        String responseString = response.body;
        log('saveresponseString=======$responseString');
        var saveIt = saveSalesInvoiceFromJson(data);
        log('save-----------$saveIt');
        return saveIt;
      }
    } catch (e) {
      log('saveadddingAPIeroooorrrrrrrrrr____________${e.toString()}');
    }
    log('saveOONN------$saveOn');
    return saveOn;
  }
}
