import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'shift_attendance.dart';

part 'shift.g.dart';

@JsonSerializable()
@immutable
class Shift {
  final int id;
  final List<ShiftAttendance> attendances;

  @JsonKey(name: "absolute_url")
  final String absoluteUrl;
  final String name;
  @JsonKey(name: "num_required_attendances")
  final int numRequiredAttendances;
  final String description;
  @JsonKey(name: "start_time")
  final DateTime startTime;
  @JsonKey(name: "end_time")
  final DateTime endTime;

  const Shift({
    required this.id,
    required this.attendances,
    required this.absoluteUrl,
    required this.name,
    required this.numRequiredAttendances,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
