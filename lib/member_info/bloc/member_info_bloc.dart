import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/member_info/model/member_info.dart';
import 'package:wir_markt/member_info/repository/member_info_repository.dart';

import 'member_info_event.dart';
import 'member_info_state.dart';

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
    emit(state.copyWith(status: Status.loading));
    try {
      MemberInfo? details =
          await _memberInfoRepository.getMemberInfo(event.jwtToken);
      emit(state.copyWith(status: Status.completed, memberInfo: details));
    } on StatusCodeException {
      emit(state.copyWith(status: Status.error, memberInfo: null));
    }
  }
}
