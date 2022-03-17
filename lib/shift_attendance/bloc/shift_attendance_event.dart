part of 'shift_attendance_bloc.dart';

class ShiftAttendanceEvent extends Equatable {
  const ShiftAttendanceEvent();

  @override
  List<Object> get props => [];
}

class RefreshShiftAttendance extends ShiftAttendanceEvent {
  final JwtToken jwtToken;

  const RefreshShiftAttendance(this.jwtToken);
}
