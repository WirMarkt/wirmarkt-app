import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../shift_attendance/bloc/shift_attendance_bloc.dart';
import '../../shift_attendance/repository/shift_attendance_repository.dart';
import 'upcoming_shift_area.dart';

class UpcomingShiftPage extends StatelessWidget {
  const UpcomingShiftPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UpcomingShiftPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).upcomingShift)),
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) {
            return ShiftAttendanceBloc(
              shiftAttendanceRepository:
                  RepositoryProvider.of<ShiftAttendanceRepository>(context),
            );
          },
          child: const UpcomingShiftArea(),
        ),
      ),
    );
  }
}
