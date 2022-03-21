import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';
import '../repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserState()) {
    on<RefreshUser>(_onRefreshUser);
  }

  Future<void> _onRefreshUser(
    RefreshUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      User? details = await _userRepository.getUser(event.jwtToken);
      emit(state.copyWith(status: FetchStatus.completed, user: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
