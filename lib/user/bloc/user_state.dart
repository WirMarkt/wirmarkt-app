part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({this.status = FetchStatus.uninitialized, this.user});

  @override
  List<Object?> get props => [status, user];

  final FetchStatus status;
  final User? user;

  UserState copyWith({
    FetchStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
