import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';
import '../repository/shift_attendance_repository.dart';

part 'shift_attendance_event.dart';

part 'shift_attendance_state.dart';

class ShiftAttendanceBloc extends Bloc<ShiftAttendanceEvent, ShiftAttendanceState> {
  final ShiftAttendanceRepository _shiftAttendanceRepository;

  ShiftAttendanceBloc({
    required ShiftAttendanceRepository shiftAttendanceRepository,
  })  : _shiftAttendanceRepository = shiftAttendanceRepository,
        super(const ShiftAttendanceState()) {
    on<RefreshShiftAttendance>(_onRefreshShiftAttendance);
  }

  Future<void> _onRefreshShiftAttendance(
    RefreshShiftAttendance event,
    Emitter<ShiftAttendanceState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      ShiftAttendance? details = await _shiftAttendanceRepository
          .getUpcomingShiftAttendance(event.jwtToken);
      emit(state.copyWith(
          status: FetchStatus.completed, shiftAttendance: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
