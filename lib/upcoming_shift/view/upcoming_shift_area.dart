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
    var upcomingShift = upcomingShiftState.shift;
    var shiftsNeedingHelp = shiftsNeedingHelpState.shiftsNeedingHelp;

    const textPadding = const EdgeInsets.all(8.0);
    return Column(
      children: [
        if (upcomingShift != null)
          _createUpcomingShiftPanel(upcomingShift, context),
        if (upcomingShift == null)
          Padding(
            padding: textPadding,
            child: Text(S.of(context).noUpcomingShift + "."),
          ),
        if (shiftsNeedingHelp.isNotEmpty)
          _createShiftsNeedingHelpPanel(shiftsNeedingHelp, context),
        if (shiftsNeedingHelp.isEmpty)
          Padding(
            padding: textPadding,
            child: Text(S.of(context).noShiftsThatRequireHelp + "."),
          ),
      ],
    );
  }

  _UpcomingShiftPanel _createUpcomingShiftPanel(
      Shift shift, BuildContext context) {
    var authState = context.read<AuthenticationBloc>().state;
    var userId = authState.jwtToken.userId;
    AttendanceState? attendanceState;
    String slotName = "";
    try {
      ShiftAttendance shiftAttendance =
          shift.attendances.firstWhere((e) => e.userId == userId);
      attendanceState = shiftAttendance.state;
      slotName = shiftAttendance.slotName;
    } on StateError {
      //no shift attendance found
    }

    return _UpcomingShiftPanel(
      shift: shift,
      slotName: slotName,
      state: attendanceState,
    );
  }

  Widget _createShiftsNeedingHelpPanel(
      List<Shift> shiftsNeedingHelp, BuildContext context) {
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
          ...shiftsNeedingHelp
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
  final String slotName;
  final Shift shift;

  const _UpcomingShiftPanel({
    required this.state,
    required this.slotName,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    var shiftName = shift.name;
    if (slotName.isNotEmpty) {
      shiftName = "${shift.name}: $slotName";
    }
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
            shiftName: shiftName,
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
