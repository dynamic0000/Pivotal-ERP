import 'dart:convert';
import 'dart:developer';

import 'package:pivotal_erp/models/token_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<TokenModel?> getToken(String userName, String password) async {
    try {
      var uri = Uri.parse('https://demo.pivotalerp.app/v1//token');
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
      return null;
    } catch (e) {
      rethrow;
    }
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
      return "error Failed";
    }
  }
}
