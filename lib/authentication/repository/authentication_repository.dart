import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

//TODO using a separate class, also store access token in secure storage for "remember"

class AuthenticationRepository {
  final ApiRepository _apiRepository;

  static const tokenStorageKey = "wm_app_jwt";

  final storage = const FlutterSecureStorage();

  final _controller = StreamController<AuthenticationState>();

  AuthenticationRepository(this._apiRepository);

  /// stream of authentication state updates
  Stream<AuthenticationState> get status => _controller.stream;

  /// @throws [ApiException]
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    var jsonResponse = await _apiRepository
        .post("/token/", body: {"username": username, "password": password});
    var responseToken = JwtToken.fromJson(jsonResponse);
    _saveLogin(responseToken);
    _controller.add(AuthenticationState.authenticated(responseToken));
  }

  /// @throws [ApiException]
  Future<void> refreshToken(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.post("/token/refresh/", body: jwtToken.toJson());
    var responseToken = JwtToken.fromJson(jsonResponse);
    var refreshedToken = JwtToken(responseToken.accessToken,
        responseToken.refreshToken ?? jwtToken.refreshToken);
    _saveLogin(refreshedToken);
    _controller.add(AuthenticationState.authenticated(refreshedToken));
  }

  void logOut() {
    _saveLogin(null);
    _controller.add(const AuthenticationState.unauthenticated());
  }

  void dispose() => _controller.close();

  void refreshFromStorage() async {
    try {
      var memoryToken = await storage.read(key: tokenStorageKey);
      if (memoryToken != null) {
        var parsedJwtToken = JwtToken.fromJson(jsonDecode(memoryToken));
        if (parsedJwtToken.hasValidRefreshToken) {
          // refresh token will inform _controller
          await refreshToken(parsedJwtToken);
          return;
        }
      }
    } catch (_) {}
    // either failed above or wasn't refresh successfully
    _controller.add(const AuthenticationState.unauthenticated());
  }

  void _saveLogin(JwtToken? token) async {
    if (token != null) {
      var jsonString = jsonEncode(token.toJson());
      await storage.write(key: tokenStorageKey, value: jsonString);
    } else {
      await storage.delete(key: tokenStorageKey);
    }
  }
}
