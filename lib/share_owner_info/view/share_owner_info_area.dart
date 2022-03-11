import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/widgets/widgets.dart';

import '../../tapir_user/bloc/tapir_user_bloc.dart';
import 'share_owner_info_column.dart';

class ShareOwnerInfoArea extends StatefulWidget {
  const ShareOwnerInfoArea({Key? key}) : super(key: key);

  @override
  State<ShareOwnerInfoArea> createState() => _ShareOwnerInfoAreaState();
}

class _ShareOwnerInfoAreaState extends State<ShareOwnerInfoArea> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: BlocBuilder<TapirUserBloc, TapirUserState>(
        builder: (context, state) {
          switch (state.status) {
            case FetchStatus.uninitialized:
            case FetchStatus.loading:
              return Loading(
                  loadingMessage: S.of(context).loadingMembershipInfo);
            case FetchStatus.completed:
              return ShareOwnerInfoColumn(tapirUser: state.tapirUser!);
            case FetchStatus.error:
              return ErrorDisplay(
                errorMessage: S.of(context).failedToLoadMembershipInfo,
                onRetryPressed: () {
                  var jwtToken =
                      context.read<AuthenticationBloc>().state.jwtToken;
                  context.read<TapirUserBloc>().add(RefreshTapirUser(jwtToken));
                },
              );
          }
        },
      ),
      onAuthenticated: (state) =>
          context.read<TapirUserBloc>().add(RefreshTapirUser(state.jwtToken)),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
