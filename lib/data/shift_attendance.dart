import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shift_attendance.g.dart';

@JsonSerializable()
@immutable
class ShiftAttendance {
  final int id;

  @JsonKey(name: "reminder_email_sent") //: false,
  final bool reminderEmailSent;
  @_AttendanceStateConverter()
  final AttendanceState state;
  @JsonKey(name: "excused_reason") //: "",
  final String excusedReason;
  @JsonKey(name: "last_state_update") //: "2022-03-01T14:59:28.134355+01:00",
  final DateTime lastStateUpdate;

  @JsonKey(name: "user_id")
  final int userId;

  factory ShiftAttendance.fromJson(Map<String, dynamic> json) =>
      _$ShiftAttendanceFromJson(json);

  const ShiftAttendance({
    required this.id,
    required this.userId,
    required this.reminderEmailSent,
    required this.state,
    required this.excusedReason,
    required this.lastStateUpdate,
  });

  Map<String, dynamic> toJson() => _$ShiftAttendanceToJson(this);
}

enum AttendanceState {
  pending,
  done,
  cancelled,
  missed,
  missedExcused,
  lookingForStandIn,
}

class _AttendanceStateConverter extends JsonConverter<AttendanceState, int> {
  const _AttendanceStateConverter();

  static const _stateValueToState = {
    1: AttendanceState.pending,
    2: AttendanceState.done,
    3: AttendanceState.cancelled,
    4: AttendanceState.missed,
    5: AttendanceState.missedExcused,
    6: AttendanceState.lookingForStandIn,
  };

  @override
  AttendanceState fromJson(int json) {
    return _stateValueToState[json] ?? AttendanceState.pending;
  }

  @override
  int toJson(AttendanceState object) {
    return _stateValueToState.entries
        .firstWhere((element) => element.value == object)
        .key;
  }
}
