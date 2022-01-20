import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';
import 'package:wir_markt/member_info/model/member_info.dart';
import 'package:wir_markt/member_info/repository/member_info_repository.dart';

part 'member_info_event.dart';
part 'member_info_state.dart';

class MemberInfoBloc extends Bloc<MemberInfoEvent, MemberInfoState> {
  final MemberInfoRepository _memberInfoRepository;

  MemberInfoBloc({
    required MemberInfoRepository memberInfoRepository,
  })  : _memberInfoRepository = memberInfoRepository,
        super(const MemberInfoState()) {
    on<RefreshMemberInfo>(_onRefreshMemberInfo);
  }

  Future<void> _onRefreshMemberInfo(
    RefreshMemberInfo event,
    Emitter<MemberInfoState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      MemberInfo? details =
          await _memberInfoRepository.getMemberInfo(event.jwtToken);
      emit(state.copyWith(status: FetchStatus.completed, memberInfo: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
