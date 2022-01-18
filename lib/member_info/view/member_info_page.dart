import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/utils/status.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_info/bloc/member_info_event.dart';
import 'package:wir_markt/member_info/bloc/member_info_state.dart';
import 'package:wir_markt/member_info/repository/member_info_repository.dart';
import 'package:wir_markt/widgets/error_display.dart';
import 'package:wir_markt/widgets/loading.dart';

import '../bloc/member_info_bloc.dart';
import 'member_info_column.dart';

class MemberInfoPage extends StatelessWidget {
  const MemberInfoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MemberInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).membershipTitle)),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return MemberInfoBloc(
              memberInfoRepository:
                  RepositoryProvider.of<MemberInfoRepository>(context),
            );
          },
          child: const MemberInfoForm(),
        ),
      ),
    );
  }
}

class MemberInfoForm extends StatefulWidget {
  const MemberInfoForm({Key? key}) : super(key: key);

  @override
  State<MemberInfoForm> createState() => _MemberInfoFormState();
}

class _MemberInfoFormState extends State<MemberInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SafeArea(
        child: BlocBuilder<MemberInfoBloc, MemberInfoState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.uninitialized:
              case Status.loading:
                return Loading(
                    loadingMessage: S.of(context).loadingMembershipInfo);
              case Status.completed:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: MemberInfoColumn(qrCode: state.memberInfo.idQrCode),
                );
              case Status.error:
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
