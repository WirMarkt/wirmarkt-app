import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/widgets/widgets.dart';

import '../../user/bloc/user_bloc.dart';
import 'member_id_column.dart';

class MemberInfoArea extends StatefulWidget {
  const MemberInfoArea({Key? key}) : super(key: key);

  @override
  State<MemberInfoArea> createState() => _MemberInfoAreaState();
}

class _MemberInfoAreaState extends State<MemberInfoArea> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          switch (state.status) {
            case FetchStatus.uninitialized:
            case FetchStatus.loading:
              return ColoredProgressIndicator();
            case FetchStatus.completed:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: MemberInfoColumn(user: state.user!),
              );
            case FetchStatus.error:
              return ErrorDisplay(
                errorMessage: S.of(context).failedToLoadData,
                onRetryPressed: () {
                  var jwtToken =
                      context.read<AuthenticationBloc>().state.jwtToken;
                  context.read<UserBloc>().add(RefreshUser(jwtToken));
                },
              );
          }
        },
      ),
      onAuthenticated: (state) =>
          context.read<UserBloc>().add(RefreshUser(state.jwtToken)),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
