import 'package:flutter/foundation.dart';

import '../../api/repository/api_repository.dart';
import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';

@immutable
class ShiftsNeedingHelpRepository {
  final ApiRepository _apiRepository;

  const ShiftsNeedingHelpRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<List<Shift>> getShiftsNeedingHelp(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.get("/shift/needs_help/", jwtToken: jwtToken);
    return (jsonResponse as List).map((e) {
      return Shift.fromJson(e);
    }).toList();
  }
}
