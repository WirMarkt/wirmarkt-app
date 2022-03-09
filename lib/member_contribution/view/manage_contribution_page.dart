import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_contribution/bloc/member_contribution_bloc.dart';
import 'package:wir_markt/member_contribution/repository/member_contribution_repository.dart';

import 'manage_contribution_area.dart';

class ManageContributionPage extends StatelessWidget {
  const ManageContributionPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ManageContributionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).nextShift)),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return MemberContributionBloc(
              memberContributionRepository:
              RepositoryProvider.of<MemberContributionRepository>(context),
            );
          },
          child: const ManageContributionArea(),
        ),
      ),
    );
  }


}