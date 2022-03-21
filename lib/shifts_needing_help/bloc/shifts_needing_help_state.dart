part of 'shifts_needing_help_bloc.dart';

class ShiftsNeedingHelpState extends Equatable {
  const ShiftsNeedingHelpState(
      {this.status = FetchStatus.uninitialized,
      this.shiftsNeedingHelp = const []});

  @override
  List<Object?> get props => [status, shiftsNeedingHelp];

  final FetchStatus status;
  final List<Shift> shiftsNeedingHelp;

  ShiftsNeedingHelpState copyWith({
    FetchStatus? status,
    List<Shift>? shiftsNeedingHelp,
  }) {
    return ShiftsNeedingHelpState(
      status: status ?? this.status,
      shiftsNeedingHelp: shiftsNeedingHelp ?? this.shiftsNeedingHelp,
    );
  }
}
