import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';
import '../repository/upcoming_shift_repository.dart';

part 'upcoming_shift_event.dart';

part 'upcoming_shift_state.dart';

class UpcomingShiftBloc extends Bloc<UpcomingShiftEvent, UpcomingShiftState> {
  final UpcomingShiftRepository _upcomingShiftRepository;

  UpcomingShiftBloc({
    required UpcomingShiftRepository upcomingShiftRepository,
  })  : _upcomingShiftRepository = upcomingShiftRepository,
        super(const UpcomingShiftState()) {
    on<RefreshUpcomingShift>(_onRefreshShiftAttendance);
  }

  Future<void> _onRefreshShiftAttendance(
    RefreshUpcomingShift event,
    Emitter<UpcomingShiftState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      Shift? details =
          await _upcomingShiftRepository.getUpcomingShift(event.jwtToken);
      emit(state.copyWith(status: FetchStatus.completed, shift: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
