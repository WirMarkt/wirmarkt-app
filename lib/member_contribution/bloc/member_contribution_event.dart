part of 'member_contribution_bloc.dart';

class MemberContributionEvent extends Equatable {
  const MemberContributionEvent();

  @override
  List<Object> get props => [];
}


class RefreshMemberContribution extends MemberContributionEvent {
  final JwtToken jwtToken;

  const RefreshMemberContribution(this.jwtToken);
}