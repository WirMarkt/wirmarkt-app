import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';
import '../repository/tapir_user_repository.dart';

part 'tapir_user_event.dart';
part 'tapir_user_state.dart';

class TapirUserBloc extends Bloc<TapirUserEvent, TapirUserState> {
  final TapirUserRepository _tapirUserRepository;

  TapirUserBloc({
    required TapirUserRepository tapirUserRepository,
  })  : _tapirUserRepository = tapirUserRepository,
        super(const TapirUserState()) {
    on<RefreshTapirUser>(_onRefreshTapirUser);
  }

  Future<void> _onRefreshTapirUser(
    RefreshTapirUser event,
    Emitter<TapirUserState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      TapirUser? details =
          await _tapirUserRepository.getTapirUser(event.jwtToken);
      emit(state.copyWith(status: FetchStatus.completed, tapirUser: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
