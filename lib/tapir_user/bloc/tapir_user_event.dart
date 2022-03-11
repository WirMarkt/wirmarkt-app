
part of 'tapir_user_bloc.dart';

class TapirUserEvent extends Equatable {
  const TapirUserEvent();

  @override
  List<Object> get props => [];
}


class RefreshTapirUser extends TapirUserEvent {
  final JwtToken jwtToken;

  const RefreshTapirUser(this.jwtToken);
}