// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberContribution _$MemberContributionFromJson(Map<String, dynamic> json) =>
    MemberContribution(
      statusString: json['status'] as String?,
      attendedWelcomeSession: json['attended_welcome_session'] as bool?,
      nextShiftAttendanceStateValue:
          json['next_shift_attendance_state'] as int?,
      nextShiftName: json['next_shift_name'] as String?,
      nextShiftID: json['next_shift_id'] as String?,
      nextShiftUrl: json['next_shift_url'] as String?,
      nextShiftStartTimeEpochMillis:
          json['next_shift_start_time_epoch_ms'] as int?,
      nextShiftEndTimeEpochMillis: json['next_shift_end_time_epoch_ms'] as int?,
      sepaAccountHolder: json['sepa_account_holder'] as String?,
      sepaIban: json['sepa_iban'] as String?,
      signedSepaMandate: json['signed_sepa_mandate'] as bool?,
      isInvesting: json['is_investing'] as bool?,
      shareCount: json['share_count'] as int? ?? 0,
    );

Map<String, dynamic> _$MemberContributionToJson(MemberContribution instance) =>
    <String, dynamic>{
      'status': instance.statusString,
      'attended_welcome_session': instance.attendedWelcomeSession,
      'next_shift_attendance_state': instance.nextShiftAttendanceStateValue,
      'next_shift_name': instance.nextShiftName,
      'next_shift_id': instance.nextShiftID,
      'next_shift_url': instance.nextShiftUrl,
      'next_shift_start_time_epoch_ms': instance.nextShiftStartTimeEpochMillis,
      'next_shift_end_time_epoch_ms': instance.nextShiftEndTimeEpochMillis,
      'sepa_account_holder': instance.sepaAccountHolder,
      'sepa_iban': instance.sepaIban,
      'signed_sepa_mandate': instance.signedSepaMandate,
      'is_investing': instance.isInvesting,
      'share_count': instance.shareCount,
    };
