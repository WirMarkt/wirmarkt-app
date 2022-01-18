import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wir_markt/authentication/models/jwt_token.dart';
import 'package:wir_markt/data/app_config.dart';

import 'status_code_exception.dart';

class ApiRepository {


  Future<Map<String, dynamic>> get(String path,
      {JwtToken? jwtToken}) async {
    var uri = Uri.parse(AppConfig.get().apiUrl + path);
    Map<String, String> headers = await _prepareHeaders(jwtToken);
    var res = await http.get(uri, headers: headers);
    return _handleResponse(res);
  }

  Future<Map<String, dynamic>> post(String path,
      {JwtToken? jwtToken, Map<String, dynamic>? body}) async {
    var uri = Uri.parse(AppConfig.get().apiUrl + path);
    Map<String, String> headers = await _prepareHeaders(jwtToken);
    headers['Content-Type'] = "application/json";
    var res = await http.post(uri, body: jsonEncode(body), headers: headers);
    return _handleResponse(res);
  }

  Future<Map<String, String>> _prepareHeaders(
      JwtToken? jwtToken) async {
    Map<String, String> headers = {};
    if (jwtToken != null) {
      headers["Authorization"] = "Bearer ${jwtToken.accessToken}";
    }
    return headers;
  }

  //TODO rework this
  dynamic _handleResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body);
      case 400:
        throw BadRequestException(res.statusCode);
      case 401:
      case 403:
        throw UnauthorisedException(res.statusCode);
      case 500:
      default:
        throw FetchDataException(
            res.statusCode, "Error occurred while communicating with server.");
    }
  }
}
