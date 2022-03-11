import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../authentication/authentication.dart';
import '../../authentication/widget/authenticated.dart';
import '../../data/data.dart';
import '../../generated/l10n.dart';
import '../../shift_attendance/bloc/shift_attendance_bloc.dart';
import '../../widgets/widgets.dart';
import '../widget/member_ship_state_info_card.dart';
import '../widget/shift_card.dart';

class UpcomingShiftArea extends StatelessWidget {
  const UpcomingShiftArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: BlocBuilder<ShiftAttendanceBloc, ShiftAttendanceState>(
          builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return Loading(loadingMessage: S.of(context).loadingMembershipInfo);
          case FetchStatus.completed:
            return _createUpcomingShiftInfo(state, context);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadMembershipInfo,
              onRetryPressed: () {
                var jwtToken =
                    context.read<AuthenticationBloc>().state.jwtToken;
                context
                    .read<ShiftAttendanceBloc>()
                    .add(RefreshShiftAttendance(jwtToken));
              },
            );
        }
      }),
      onAuthenticated: (state) => context
          .read<ShiftAttendanceBloc>()
          .add(RefreshShiftAttendance(state.jwtToken)),
    );
  }

  Widget _createUpcomingShiftInfo(
      ShiftAttendanceState state, BuildContext context) {
    if (state.shiftAttendance?.shift != null) {
      return _UpcomingShiftPanel(
        shift: state.shiftAttendance!.shift!,
        state: state.shiftAttendance!.state,
      );
    } else {
      return _ManageMemberShipPanel(S.of(context).noUpcomingShift);
    }
  }
}

@immutable
class _UpcomingShiftPanel extends StatelessWidget {
  final AttendanceState state;
  final Shift shift;

  const _UpcomingShiftPanel({
    required this.state,
    required this.shift,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).upcomingShift,
            style: textTheme.titleMedium,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          ShiftCard(
            shiftName: shift.name,
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

@immutable
class _ManageMemberShipPanel extends StatelessWidget {
  final String memberShipStateMessage;

  const _ManageMemberShipPanel(
    this.memberShipStateMessage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).manageMembership,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          MemberShipStateInfoCard(memberShipStateMessage),
        ],
      ),
    );
  }
}
