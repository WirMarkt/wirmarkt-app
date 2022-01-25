import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_contribution.g.dart';

@JsonSerializable()
@immutable
class MemberContribution {
  static const MemberContribution empty = MemberContribution();

  @JsonKey(name: "status")
  final String? statusString;

  MemberStatus? get status {
    try {
      return MemberStatus.values
          .firstWhere((element) => element.name == statusString);
    } on StateError {
      return null;
    }
  }

  @JsonKey(name: "attended_welcome_session")
  final bool? attendedWelcomeSession;
  @JsonKey(name: "is_paying")
  final bool? isPaying;
  @JsonKey(name: "next_shift_attendance_state")
  final int? nextShiftAttendanceStateValue;

  ShiftAttendanceState? get nextShiftAttendanceState =>
      nextShiftAttendanceStateValue != null
          ? ShiftAttendanceStateTranslator.fromStateValue(
              nextShiftAttendanceStateValue!)
          : null;

  @JsonKey(name: "next_shift_name")
  final String? nextShiftName;
  @JsonKey(name: "next_shift_id")
  final String? nextShiftID;
  @JsonKey(name: "next_shift_url")
  final String? nextShiftUrl;
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
      {this.statusString,
      this.attendedWelcomeSession,
      this.isPaying,
      this.nextShiftAttendanceStateValue,
      this.nextShiftName,
      this.nextShiftID,
      this.nextShiftUrl,
      this.nextShiftStartTimeEpochMillis,
      this.nextShiftEndTimeEpochMillis,
      this.sepaAccountHolder,
      this.sepaIban,
      this.signedSepaMandate});

  Map<String, dynamic> toJson() => _$MemberContributionToJson(this);
}

enum MemberStatus { sold, investing, active, paying }

enum ShiftAttendanceState {
  pending,
  done,
  cancelled,
  missed,
  missedExcused,
  lookingForStandIn,
}

class ShiftAttendanceStateTranslator {
  static const stateValueToState = {
    1: ShiftAttendanceState.pending,
    2: ShiftAttendanceState.done,
    3: ShiftAttendanceState.cancelled,
    4: ShiftAttendanceState.missed,
    5: ShiftAttendanceState.missedExcused,
    6: ShiftAttendanceState.lookingForStandIn,
  };

  static ShiftAttendanceState fromStateValue(int stateValue) {
    return stateValueToState[stateValue] ?? ShiftAttendanceState.pending;
  }
}