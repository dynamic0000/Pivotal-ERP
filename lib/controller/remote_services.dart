import 'dart:convert';
import 'dart:developer';

import 'package:pivotal_erp/constant.dart';
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
}
//old pass nai enter gareko ho
// tei ni enter old pass bhancha