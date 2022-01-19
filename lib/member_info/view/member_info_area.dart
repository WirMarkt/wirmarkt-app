import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_info/bloc/member_info_bloc.dart';
import 'package:wir_markt/widgets/widgets.dart';

import 'member_info_column.dart';

class MemberInfoArea extends StatefulWidget {
  const MemberInfoArea({Key? key}) : super(key: key);

  @override
  State<MemberInfoArea> createState() => _MemberInfoAreaState();
}

class _MemberInfoAreaState extends State<MemberInfoArea> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SafeArea(
        child: BlocBuilder<MemberInfoBloc, MemberInfoState>(
          builder: (context, state) {
            switch (state.status) {
              case FetchStatus.uninitialized:
              case FetchStatus.loading:
                return Loading(
                    loadingMessage: S.of(context).loadingMembershipInfo);
              case FetchStatus.completed:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: MemberInfoColumn(memberInfo: state.memberInfo),
                );
              case FetchStatus.error:
                return ErrorDisplay(
                  errorMessage: S.of(context).failedToLoadMembershipInfo,
                  onRetryPressed: () {
                    var jwtToken =
                        context.read<AuthenticationBloc>().state.jwtToken;
                    context
                        .read<MemberInfoBloc>()
                        .add(RefreshMemberInfo(jwtToken));
                  },
                );
            }
          },
        ),
      ),
      onAuthenticated: (state) =>
          context.read<MemberInfoBloc>().add(RefreshMemberInfo(state.jwtToken)),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
