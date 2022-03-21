// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftAttendance _$ShiftAttendanceFromJson(Map<String, dynamic> json) =>
    ShiftAttendance(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      reminderEmailSent: json['reminder_email_sent'] as bool,
      state: const _AttendanceStateConverter().fromJson(json['state'] as int),
      excusedReason: json['excused_reason'] as String,
      lastStateUpdate: DateTime.parse(json['last_state_update'] as String),
    );

Map<String, dynamic> _$ShiftAttendanceToJson(ShiftAttendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reminder_email_sent': instance.reminderEmailSent,
      'state': const _AttendanceStateConverter().toJson(instance.state),
      'excused_reason': instance.excusedReason,
      'last_state_update': instance.lastStateUpdate.toIso8601String(),
      'user_id': instance.userId,
    };
