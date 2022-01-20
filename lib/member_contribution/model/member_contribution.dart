import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_contribution.g.dart';

@JsonSerializable()
@immutable
class MemberContribution {
  static const MemberContribution empty = MemberContribution(
    status: "",
    attendedWelcomeSession: false,
    isPaying: false,
    nextShiftName: "",
    nextShiftStartTimeEpochMillis: 0,
    nextShiftEndTimeEpochMillis: 0,
    sepaAccountHolder: "",
    sepaIban: "",
    signedSepaMandate: false,
  );

  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "attended_welcome_session")
  final bool? attendedWelcomeSession;
  @JsonKey(name: "is_paying")
  final bool? isPaying;
  @JsonKey(name: "next_shift_name")
  final String? nextShiftName;
  @JsonKey(name: "next_shift_start_time_epoch_ms")
  final int? nextShiftStartTimeEpochMillis;

  DateTime? get nextShiftStartTime => nextShiftStartTimeEpochMillis != null
      ? DateTime.fromMillisecondsSinceEpoch(nextShiftStartTimeEpochMillis!)
      : null;

  @JsonKey(name: "next_shift_end_time_epoch_ms")
  final int? nextShiftEndTimeEpochMillis;

  DateTime? get nextShiftEndTime => nextShiftEndTimeEpochMillis != null
      ? DateTime.fromMillisecondsSinceEpoch(nextShiftEndTimeEpochMillis!)
      : null;

  @JsonKey(name: "sepa_account_holder")
  final String? sepaAccountHolder;
  @JsonKey(name: "sepa_iban")
  final String? sepaIban;
  @JsonKey(name: "signed_sepa_mandate")
  final bool? signedSepaMandate;

  factory MemberContribution.fromJson(Map<String, dynamic> json) =>
      _$MemberContributionFromJson(json);

  const MemberContribution(
      {required this.status,
      required this.attendedWelcomeSession,
      required this.isPaying,
      required this.nextShiftName,
      required this.nextShiftStartTimeEpochMillis,
      required this.nextShiftEndTimeEpochMillis,
      required this.sepaAccountHolder,
      required this.sepaIban,
      required this.signedSepaMandate});

  Map<String, dynamic> toJson() => _$MemberContributionToJson(this);
}
