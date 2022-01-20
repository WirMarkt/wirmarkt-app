// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberContribution _$MemberContributionFromJson(Map<String, dynamic> json) =>
    MemberContribution(
      status: json['status'] as String?,
      attendedWelcomeSession: json['attended_welcome_session'] as bool?,
      isPaying: json['is_paying'] as bool?,
      nextShiftName: json['next_shift_name'] as String?,
      nextShiftStartTimeEpochMillis:
          json['next_shift_start_time_epoch_ms'] as int?,
      nextShiftEndTimeEpochMillis: json['next_shift_end_time_epoch_ms'] as int?,
      sepaAccountHolder: json['sepa_account_holder'] as String?,
      sepaIban: json['sepa_iban'] as String?,
      signedSepaMandate: json['signed_sepa_mandate'] as bool?,
    );

Map<String, dynamic> _$MemberContributionToJson(MemberContribution instance) =>
    <String, dynamic>{
      'status': instance.status,
      'attended_welcome_session': instance.attendedWelcomeSession,
      'is_paying': instance.isPaying,
      'next_shift_name': instance.nextShiftName,
      'next_shift_start_time_epoch_ms': instance.nextShiftStartTimeEpochMillis,
      'next_shift_end_time_epoch_ms': instance.nextShiftEndTimeEpochMillis,
      'sepa_account_holder': instance.sepaAccountHolder,
      'sepa_iban': instance.sepaIban,
      'signed_sepa_mandate': instance.signedSepaMandate,
    };
