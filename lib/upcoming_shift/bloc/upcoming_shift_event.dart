part of 'upcoming_shift_bloc.dart';

class UpcomingShiftEvent extends Equatable {
  const UpcomingShiftEvent();

  @override
  List<Object> get props => [];
}

class RefreshUpcomingShift extends UpcomingShiftEvent {
  final JwtToken jwtToken;

  const RefreshUpcomingShift(this.jwtToken);
}
