part of 'shift_attendance_bloc.dart';

class ShiftAttendanceState extends Equatable {
  const ShiftAttendanceState(
      {this.status = FetchStatus.uninitialized, this.shiftAttendance});

  @override
  List<Object?> get props => [status, shiftAttendance];

  final FetchStatus status;
  final ShiftAttendance? shiftAttendance;

  ShiftAttendanceState copyWith({
    FetchStatus? status,
    ShiftAttendance? shiftAttendance,
  }) {
    return ShiftAttendanceState(
      status: status ?? this.status,
      shiftAttendance: shiftAttendance ?? this.shiftAttendance,
    );
  }
}
