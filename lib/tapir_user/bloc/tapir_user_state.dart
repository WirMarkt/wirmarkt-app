part of 'tapir_user_bloc.dart';

class TapirUserState extends Equatable {
  const TapirUserState(
      {this.status = FetchStatus.uninitialized, this.tapirUser});

  @override
  List<Object?> get props => [status, tapirUser];

  final FetchStatus status;
  final TapirUser? tapirUser;

  TapirUserState copyWith({
    FetchStatus? status,
    TapirUser? tapirUser,
  }) {
    return TapirUserState(
      status: status ?? this.status,
      tapirUser: tapirUser ?? this.tapirUser,
    );
  }
}
