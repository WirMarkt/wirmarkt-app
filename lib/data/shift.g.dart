// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      id: json['id'] as int,
      attendances: (json['attendances'] as List<dynamic>)
          .map((e) => ShiftAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
      absoluteUrl: json['absolute_url'] as String,
      name: json['name'] as String,
      numRequiredAttendances: json['num_required_attendances'] as int,
      description: json['description'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'id': instance.id,
      'attendances': instance.attendances,
      'absolute_url': instance.absoluteUrl,
      'name': instance.name,
      'num_required_attendances': instance.numRequiredAttendances,
      'description': instance.description,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
    };
