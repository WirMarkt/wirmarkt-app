import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../authentication/authentication.dart';
import '../../authentication/widget/authenticated.dart';
import '../../generated/l10n.dart';
import '../../user/bloc/user_bloc.dart';
import '../../widgets/widgets.dart';
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
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          switch (state.status) {
            case FetchStatus.uninitialized:
            case FetchStatus.loading:
              return Loading(
                  loadingMessage: S.of(context).loadingMembershipInfo);
            case FetchStatus.completed:
              return ShareOwnerInfoColumn(user: state.user!);
            case FetchStatus.error:
              return ErrorDisplay(
                errorMessage: S.of(context).failedToLoadMembershipInfo,
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
