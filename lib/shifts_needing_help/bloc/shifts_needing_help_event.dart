part of 'shifts_needing_help_bloc.dart';

class ShiftsNeedingHelpEvent extends Equatable {
  const ShiftsNeedingHelpEvent();

  @override
  List<Object> get props => [];
}

class RefreshShiftsNeedingHelp extends ShiftsNeedingHelpEvent {
  final JwtToken jwtToken;

  const RefreshShiftsNeedingHelp(this.jwtToken);
}
