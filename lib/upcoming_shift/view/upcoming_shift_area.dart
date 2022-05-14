import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../authentication/authentication.dart';
import '../../authentication/widget/authenticated.dart';
import '../../data/data.dart';
import '../../generated/l10n.dart';
import '../../shifts_needing_help/bloc/shifts_needing_help_bloc.dart';
import '../../widgets/widgets.dart';
import '../bloc/upcoming_shift_bloc.dart';
import '../widget/shift_card.dart';

class UpcomingShiftArea extends StatelessWidget {
  const UpcomingShiftArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: Builder(
        builder: (context) {
          final shiftsNeedingHelpState =
              context.watch<ShiftsNeedingHelpBloc>().state;
          final upcomingShiftState = context.watch<UpcomingShiftBloc>().state;

          var statusList = [
            shiftsNeedingHelpState.status,
            upcomingShiftState.status
          ];

          if (statusList.contains(FetchStatus.uninitialized) ||
              statusList.contains(FetchStatus.loading)) {
            return ColoredProgressIndicator();
          } else if (statusList.contains(FetchStatus.error)) {
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadData,
              onRetryPressed: () {
                _refreshBlocs(context);
              },
            );
          } else {
            return _createUpcomingShiftInfo(
                upcomingShiftState, shiftsNeedingHelpState, context);
          }
        },
      ),
      onAuthenticated: (state) {
        _refreshBlocs(context);
      },
    );
  }

  void _refreshBlocs(BuildContext context) {
    var jwtToken = context.read<AuthenticationBloc>().state.jwtToken;
    context.read<UpcomingShiftBloc>().add(RefreshUpcomingShift(jwtToken));
    context
        .read<ShiftsNeedingHelpBloc>()
        .add(RefreshShiftsNeedingHelp(jwtToken));
  }

  Widget _createUpcomingShiftInfo(
    UpcomingShiftState upcomingShiftState,
    ShiftsNeedingHelpState shiftsNeedingHelpState,
    BuildContext context,
  ) {
    var upcomingShiftPanel =
        _createUpcomingShiftPanel(upcomingShiftState, context);
    var shiftsNeedingHelpPanel =
        _createShiftsNeedingHelpPanel(shiftsNeedingHelpState, context);

    return Column(
      children: [
        if (upcomingShiftPanel != null) upcomingShiftPanel,
        shiftsNeedingHelpPanel,
      ],
    );
  }

  _UpcomingShiftPanel? _createUpcomingShiftPanel(
      UpcomingShiftState upcomingShiftState, BuildContext context) {
    if (upcomingShiftState.shift != null) {
      var shift = upcomingShiftState.shift;
      var authState = context.read<AuthenticationBloc>().state;
      var userId = authState.jwtToken.userId;
      AttendanceState? attendanceState;
      String? slotName;
      try {
        ShiftAttendance shiftAttendance =
            shift!.attendances.firstWhere((e) => e.userId == userId);
        attendanceState = shiftAttendance.state;
        slotName = shiftAttendance.slotName;
      } on StateError {
        //no shift attendance found
      }

      return _UpcomingShiftPanel(
        shift: upcomingShiftState.shift!,
        slotName: slotName,
        state: attendanceState,
      );
    } else {
      return null;
    }
  }

  Widget _createShiftsNeedingHelpPanel(
      ShiftsNeedingHelpState shiftsNeedingHelpState, BuildContext context) {
    var shifts = shiftsNeedingHelpState.shiftsNeedingHelp;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).shiftsThatNeedSupport,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          ...shifts
              .take(10)
              .map((e) {
                return [
                  ShiftCard(
                    shiftName: e.name,
                    shiftEnd: e.endTime,
                    shiftStart: e.startTime,
                    shiftUrl: e.absoluteUrl,
                  ),
                  SizedBox(height: 16.0),
                ];
              })
              .expand((element) => element)
              .toList()
        ],
      ),
    );
  }
}

@immutable
class _UpcomingShiftPanel extends StatelessWidget {
  final AttendanceState? state;
  final String? slotName;
  final Shift shift;

  const _UpcomingShiftPanel({
    required this.state,
    required this.slotName,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).yourUpcomingShift,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          ShiftCard(
            shiftName: slotName ?? S.of(context).supermarket,
            shiftStart: shift.startTime,
            shiftEnd: shift.endTime,
            shiftUrl: shift.absoluteUrl,
            shiftState: state,
          ),
        ],
      ),
    );
  }
}
