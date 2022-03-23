import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../shifts_needing_help/bloc/shifts_needing_help_bloc.dart';
import '../../shifts_needing_help/repository/shifts_needing_help_repository.dart';
import '../bloc/upcoming_shift_bloc.dart';
import '../repository/upcoming_shift_repository.dart';
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
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (BuildContext context) {
                      return UpcomingShiftBloc(
                        upcomingShiftRepository:
                            RepositoryProvider.of<UpcomingShiftRepository>(context),
                      );
                    },
                  ),
                  BlocProvider(
                    create: (BuildContext context) {
                      return ShiftsNeedingHelpBloc(
                        shiftsNeedingHelpRepository:
                            RepositoryProvider.of<ShiftsNeedingHelpRepository>(
                                context),
                      );
                    },
                  ),
                ],
                child: const UpcomingShiftArea(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
