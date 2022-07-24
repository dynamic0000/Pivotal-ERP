import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pivotal_erp/constant.dart';
//
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/models/autocompleteproductList_model.dart';
import 'package:pivotal_erp/models/getproductdetails_model.dart';
import 'package:pivotal_erp/models/getvouchermodes_model.dart';
import 'package:pivotal_erp/models/getvoucherno_model.dart';
import 'package:pivotal_erp/models/saveSalesInvoice_model.dart';
import 'package:pivotal_erp/models/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:pivotal_erp/view/screens/additem_screen.dart';

import '../models/resetpassword_model.dart';

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
      // print('sad');
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

      final jsonDecoded = jsonDecode(response.body);
    } catch (e) {
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
  //String dynamic =
  //  'sNmOW6Pzwq0Z2r7Juwji04TBIqDr73qMHrEe8-Ff9wZnw-rqQ6jpdg5H365RUpPfWo4ya_lc_pD75q8v7dulPH_DH0v5a0F-NF9r98i3croWOu7gUxoTxw3YD55VN5mwkXjUAjfcJMcVm2QtrkuAE07KbCf0qCGimX9EKURcXGxEP2uSpVI7orWFaxU_ord9cr5j6L8l-29N6QEzcq1YVKt_sOevAZHHeedEzGHtbDawUTDukbznURUlEoMzJMAJST6puZUmi4plq2y0ZxMnU5b4qAH08N1xcNADUT4toFRSG9heo5OkVPIDMiOUI7FobeQj2E46VT0YQ01e1KV7HaJ85fuDiDc79HHHTkgsBVTrxewNZfeOr7VlVVpwYPiYsBosdMyvdVqNJUFemkQPxmaZLzleTiHWAuuGDdrerMU';
  Future<List<AutoCompleteProductList>> getAutoCompleteProductList(
      String? bearerTokenDynamic, String query) async {
    //Future<void> getAutoCompleteProductList() async {
    List<AutoCompleteProductList> productLists = [];
    //var data9 = [];
    var url = Uri.parse('$urlERP/v1/inventory/AutoCompleteProductList');
    try {
      AutoCompleteProductListToJSON autoCompleteProductListToJSON =
          AutoCompleteProductListToJSON(
        1,
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
          'Authorization': 'Bearer $bearerTokenDynamic'
        },
        body: jsonAutoCopleteProductList,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return [
          ...data.map((e) => AutoCompleteProductList.fromJson(e)).toList()
        ];
      } else {
        log("No data---fetch error");
      }
    } on Exception catch (e) {
      log('error-------: $e');
    }
    return productLists;
  }

  Future<GetProductDetails?> getProductDetials(
      int productIdIndex, String? bearerTokenDynamic) async {
    var url =
        Uri.parse('https://demo.pivotalerp.app/v1/inventory/GetProductDetail');
    try {
      GetProductDetialsToJSON getProductDetialsToJSON =
          GetProductDetialsToJSON(productIdIndex);
      String jsonGetProductDetials = jsonEncode(getProductDetialsToJSON);
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $bearerTokenDynamic',
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonGetProductDetials,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final productModel = GetProductDetails.fromMap(data);
        return productModel;
      }
      log('errrorr11111');
    } catch (e) {
      log('getProductDetialerrorrrr----${e.toString()};');
      rethrow;
    }
    return null;
  }

  Future<GetVoucherNo?> getVoucherNo(String? bearerTokenDynamic) async {
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
          'Authorization': 'Bearer $bearerTokenDynamic',
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonGetVoucherNo,
      );
      log('responsesese-----------${response.statusCode}');
      if (response.statusCode == 200) {
        // log('aaaaaaaaa');
        var data = jsonDecode(response.body);
        final voucherNo = GetVoucherNo.fromMap(data);
        log('VoucherNoooooo-----${voucherNo.toJson()}');
        return voucherNo;
      }
    } catch (e) {
      log('getVOucherNoooerrorrrr----${e.toString()};');
      rethrow;
    }
    return null;
  }

  Future<List<GetVoucherModes>?> getVoucherModes(
      String? bearerTokenDynamic) async {
    List<GetVoucherModes> voucherModes = [];

    var url = Uri.parse('$urlERP/v1/Account/GetVoucherModes?VoucherType=13');
    try {
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $bearerTokenDynamic',
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

  Future<SaveSalesInvoice?> saveSalesInvoices(
      {int? voucherId,
      //double? totalAmount,
      int? actualQty,
      int? discountPer,
      double? amount,
      double? rate,
      int? productId,
      int? unitId,
      String? voucherDate,
      String? bearerTokenDynamic}) async {
    var url = 'https://demo.pivotalerp.app/v1/Inventory/SaveSalesInvoice';
    try {
      Dio dio = Dio();
      var data1 = '''{ 
  VoucherDate:'$voucherDate',
  ManualVoucherNO:'',
  VoucherId:9
  RefNo:'test ref 1212',
  Narration:'Test Narration',
  PartyLedgerId:1,
  TotalAmount:152.55,
  ItemAllocationColl:
  [ 
    {
      ProductId:$productId,
      LedgerId:4,
      UnitId:$unitId,
      ActualQty:$actualQty,
      BilledQty:5,
      FreeQty:1,
      Rate:$rate,
      DiscountPer:$discountPer,
      DiscountAmt:$discountAmount,
      Amount:$amount
    },
    {
      ProductId:$productId,
      LedgerId:4,
      UnitId:$unitId,
      ActualQty:$actualQty,
      BilledQty:10,
      FreeQty:2,
      Rate:$rate,
      DiscountPer:$discountPer,
      DiscountAmt:$discountAmount,
      Amount:$amount
    }
  ],
  AditionalCostColl:[
	{
		LedgerId:5,
	        Rate:$unitId,
		Amount:$amount,
		Narration:''
	}
  ]
}''';

      log("values---------AQ$actualQty,---R$rate,---DP$discountPer,---A$amount,---PI${product.productId},---PN${product.name},---productId--$productId,---discountAmount---$discountAmount,-----$voucherDate");

      var body = {'paraDataColl': data1};

      var formData = FormData.fromMap(body);
      log('formData11------------${formData.toString()}');
      var response = await dio.put(url,
          data: formData,
          options: Options(
            headers: {
              // 'accept': '*/*',
              'Authorization': 'Bearer $bearerTokenDynamic',
              'Content-Type': 'multipart/form-data'
            },
            //contentType: 'multipart/form-data;',
            // responseType: ResponseType.json
          ));
      log('responseeeeeeeee------$response');
      Fluttertoast.showToast(msg: response.data.toString());
    } on DioError catch (e) {
      log('newdioerrro----$e');
    }
    //return  Fluttertoast.showToast(msg: response.data);
    return null;
  }
}
