part of 'member_contribution_bloc.dart';

class MemberContributionState extends Equatable {
  const MemberContributionState(
      {this.status = FetchStatus.uninitialized,
      this.memberContribution = MemberContribution.empty});

  @override
  List<Object?> get props => [status, memberContribution];

  final FetchStatus status;
  final MemberContribution memberContribution;

  MemberContributionState copyWith({
    FetchStatus? status,
    MemberContribution? memberContribution,
  }) {
    return MemberContributionState(
      status: status ?? this.status,
      memberContribution: memberContribution ?? this.memberContribution,
    );
  }
}
