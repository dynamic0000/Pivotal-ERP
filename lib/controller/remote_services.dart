import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pivotal_erp/constant.dart';
//
import 'package:pivotal_erp/models/autocompleteledger_model.dart';
import 'package:pivotal_erp/models/autocompleteproductList_model.dart';
import 'package:pivotal_erp/models/getproductdetails_model.dart';
import 'package:pivotal_erp/models/getvoucherno_model.dart';
import 'package:pivotal_erp/models/saveSalesInvoice_model.dart';
import 'package:pivotal_erp/models/token_model.dart';
import 'package:http/http.dart' as http;

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
  String dynamic =
      '_icllGuVTVys2cjplZheJPFsL4MdBiuQDQM__2Y13noLpu797ovxoj0xATAStdxBqTR6Cj6dZZBzBnT0jM6ENRITcC4bczdvpKjglkslUIJQZkmyqJFbf_mxfZbTp4JFFaxflC4lnpoiNq0_EC1ly5IYPus-WraNH9GCZXswh91CCVqlj2y9M6jN8LCXo9rewfyXo2xZ422uQIPhJiR22BrRCDFbDFKZH1_c3UfZ-rdEe3NWmeXq4qzVtd0AuIcvVT4jtKXLgPBn33OIFwkogU5copealvEmbSZWC2Nl9pC3RIUDBZG-9iObzN38NMTqtBP04uqUiDsr8EV8ztCZ3T8mdYyTTW7ZlJPOja-77gmmaL3C2Jst31A0_ntHj-qZJHIWGh2Qru0Ub5rXj2ObUTO44uwHNJ5C3cr_m7l_1mo';
  Future<List<AutoCompleteProductList>> getAutoCompleteProductList(
      String dynamicToken, String query) async {
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
          'Authorization': 'Bearer $dynamic'
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

  Future<GetProductDetails?> getProductDetials(int productIdIndex) async {
    var url =
        Uri.parse('https://demo.pivotalerp.app/v1/inventory/GetProductDetail');
    try {
      GetProductDetialsToJSON getProductDetialsToJSON =
          GetProductDetialsToJSON(productIdIndex);
      String jsonGetProductDetials = jsonEncode(getProductDetialsToJSON);
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $dynamic',
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
          'Authorization': 'Bearer $dynamic',
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

  Future<SaveSalesInvoice?> saveSalesInvoices() async {
    var url = 'https://demo.pivotalerp.app/v1/Inventory/SaveSalesInvoice';
    try {
      Dio dio = Dio();
      var data1 = """{
        "VoucherDate": "2022-07-21",
        "ManualVoucherNO": "",
        "VoucherId": 1,
        "RefNo": "test ref 1212",
        "Narration": "Test Narration",
        "PartyLedgerId": 1,
        "TotalAmount": 152.55,
        "itemAllocationColl": [
          {
            "ProductId": 1,
            "LedgerId": 4,
            "UnitId": 1,
            "ActualQty": 6,
            "BilledQty": 5,
            "FreeQty": 1,
            "Rate": 20,
            "DiscountPer": 10,
            "DiscountAmt": 10,
            "Amount": 90
          },
          {
            "ProductId": 2,
            "LedgerId": 4,
            "UnitId": 1,
            "ActualQty": 12,
            "BilledQty": 10,
            "FreeQty": 2,
            "Rate": 5,
            "DiscountPer": 10,
            "DiscountAmt": 5,
            "Amount": 45
          }
        ],
        "AditionalCostColl": [
          {"LedgerId": 5, "Rate": 13, "Amount": 17.55, "Narration": ""}
        ]
      }""";

      var body = {'paraDataColl': data1};

      var formData = FormData.fromMap(body);
      log('formData11------------${formData.toString()}');
      var response = await dio.put(url,
          data: formData,
          options: Options(
            headers: {
              'accept': '*/*',
              'Authorization': 'Bearer $dynamic',
              'Content-Type': 'multipart/form-data'
            },
            //contentType: 'Application/form-data;',
          ));
      log('responseeeeeeeee------$response');
    } on DioError catch (e) {
      log('newdioerrro----$e');
    }
    return null;
  }
}
