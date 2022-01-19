
part of 'member_info_bloc.dart';

class MemberInfoEvent extends Equatable {
  const MemberInfoEvent();

  @override
  List<Object> get props => [];
}


class RefreshMemberInfo extends MemberInfoEvent {
  final JwtToken jwtToken;

  const RefreshMemberInfo(this.jwtToken);
}