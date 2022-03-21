import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

import '../../data/data.dart';

@immutable
class UserRepository {
  final ApiRepository _apiRepository;

  const UserRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<User?> getUser(JwtToken jwtToken) async {
    var jsonResponse = await _apiRepository.get("/user/", jwtToken: jwtToken);
    return User.fromJson(jsonResponse);
  }
}
