import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';
import 'package:wir_markt/member_contribution/model/member_contribution.dart';
import 'package:wir_markt/member_contribution/repository/member_contribution_repository.dart';

part 'member_contribution_event.dart';

part 'member_contribution_state.dart';

class MemberContributionBloc
    extends Bloc<MemberContributionEvent, MemberContributionState> {
  final MemberContributionRepository _memberContributionRepository;

  MemberContributionBloc(
      {required MemberContributionRepository memberContributionRepository})
      : _memberContributionRepository = memberContributionRepository,
        super(const MemberContributionState()) {
    on<RefreshMemberContribution>(_onLoadMemberContribution);
  }

  Future<void> _onLoadMemberContribution(
    RefreshMemberContribution event,
    Emitter<MemberContributionState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      MemberContribution? details = await _memberContributionRepository
          .getMemberContribution(event.jwtToken);
      emit(state.copyWith(
          status: FetchStatus.completed, memberContribution: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
