import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';
import '../repository/shifts_needing_help_repository.dart';

part 'shifts_needing_help_event.dart';
part 'shifts_needing_help_state.dart';

class ShiftsNeedingHelpBloc
    extends Bloc<ShiftsNeedingHelpEvent, ShiftsNeedingHelpState> {
  final ShiftsNeedingHelpRepository _shiftsNeedingHelpRepository;

  ShiftsNeedingHelpBloc({
    required ShiftsNeedingHelpRepository shiftsNeedingHelpRepository,
  })  : _shiftsNeedingHelpRepository = shiftsNeedingHelpRepository,
        super(const ShiftsNeedingHelpState()) {
    on<RefreshShiftsNeedingHelp>(_onRefreshShiftAttendance);
  }

  Future<void> _onRefreshShiftAttendance(
    RefreshShiftsNeedingHelp event,
    Emitter<ShiftsNeedingHelpState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      List<Shift> details = await _shiftsNeedingHelpRepository
          .getShiftsNeedingHelp(event.jwtToken);
      emit(state.copyWith(
          status: FetchStatus.completed, shiftsNeedingHelp: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
