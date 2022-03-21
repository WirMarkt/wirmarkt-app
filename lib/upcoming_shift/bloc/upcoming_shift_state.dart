part of 'upcoming_shift_bloc.dart';

class UpcomingShiftState extends Equatable {
  const UpcomingShiftState(
      {this.status = FetchStatus.uninitialized, this.shift});

  @override
  List<Object?> get props => [status, shift];

  final FetchStatus status;
  final Shift? shift;

  UpcomingShiftState copyWith({
    FetchStatus? status,
    Shift? shift,
  }) {
    return UpcomingShiftState(
      status: status ?? this.status,
      shift: shift ?? this.shift,
    );
  }
}
