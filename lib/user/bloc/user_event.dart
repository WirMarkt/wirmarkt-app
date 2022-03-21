part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class RefreshUser extends UserEvent {
  final JwtToken jwtToken;

  const RefreshUser(this.jwtToken);
}
