import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wir_markt/authentication/models/jwt_token.dart';

import 'status_code_exception.dart';

class ApiRepository {
  final String apiUrl;

  ApiRepository(this.apiUrl);

  Future<Map<String, dynamic>> get(String path, {JwtToken? jwtToken}) async {
    var uri = Uri.parse(apiUrl + path);
    Map<String, String> headers = await _prepareHeaders(jwtToken);
    try {
      var res = await http.get(uri, headers: headers);
      return _handleResponse(res);
    } on SocketException {
      throw ApiException(statusCode: ApiExceptionType.connectionFailed);
    }
  }

  Future<Map<String, dynamic>> post(String path,
      {JwtToken? jwtToken, Map<String, dynamic>? body}) async {
    var uri = Uri.parse(apiUrl + path);
    Map<String, String> headers = await _prepareHeaders(jwtToken);
    headers['Content-Type'] = "application/json";
    try {
      var res = await http.post(uri, body: jsonEncode(body), headers: headers);
      return _handleResponse(res);
    } on SocketException {
      throw ApiException(statusCode: ApiExceptionType.connectionFailed);
    }
  }

  Future<Map<String, String>> _prepareHeaders(JwtToken? jwtToken) async {
    Map<String, String> headers = {};
    if (jwtToken != null) {
      headers["Authorization"] = "Bearer ${jwtToken.accessToken}";
    }
    return headers;
  }

  /// Throws [ApiException] on failure
  /// Returns JSON-parsed result (either Map, List or other JSON-supported type)
  dynamic _handleResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body);
      case 400:
        throw ApiException(
            statusCode: ApiExceptionType.badRequest,
            message: "Server response status code: ${res.statusCode}");

      case 401:
      case 403:
        throw ApiException(
            statusCode: ApiExceptionType.unauthenticated,
            message: "Server response status code: ${res.statusCode}");
      case 500:
      default:
        throw ApiException(
            statusCode: ApiExceptionType.serverError,
            message: "Server response status code: ${res.statusCode}");
    }
  }
}
