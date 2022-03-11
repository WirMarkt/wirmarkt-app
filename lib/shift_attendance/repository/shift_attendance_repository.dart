
import 'package:flutter/foundation.dart';

import '../../api/repository/api_repository.dart';
import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';

@immutable
class ShiftAttendanceRepository {
  final ApiRepository _apiRepository;

  const ShiftAttendanceRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<ShiftAttendance?> getUpcomingShiftAttendance(JwtToken jwtToken) async {
    var jsonResponse =
    await _apiRepository.get("/upcoming_shift_attendance/", jwtToken: jwtToken);
    return ShiftAttendance.fromJson(jsonResponse);
  }
}