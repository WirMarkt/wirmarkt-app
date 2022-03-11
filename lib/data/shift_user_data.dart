
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shift_user_data.g.dart';

@JsonSerializable()
@immutable
class ShiftUserData {
  final int id;
  final List<String> capabilities;
  @JsonKey(name: "attendance_mode")
  final String attendanceMode;
  final int user;

  const ShiftUserData({
    required this.id,
    required this.capabilities,
    required this.attendanceMode,
    required this.user,
  });

  factory ShiftUserData.fromJson(Map<String, dynamic> json) =>
      _$ShiftUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftUserDataToJson(this);
}
