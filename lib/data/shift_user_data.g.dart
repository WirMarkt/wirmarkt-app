// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftUserData _$ShiftUserDataFromJson(Map<String, dynamic> json) =>
    ShiftUserData(
      id: json['id'] as int,
      capabilities: (json['capabilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      attendanceMode: json['attendance_mode'] as String,
      user: json['user'] as int,
    );

Map<String, dynamic> _$ShiftUserDataToJson(ShiftUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capabilities': instance.capabilities,
      'attendance_mode': instance.attendanceMode,
      'user': instance.user,
    };
