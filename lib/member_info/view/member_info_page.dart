import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_info/repository/member_info_repository.dart';

import '../bloc/member_info_bloc.dart';
import 'member_info_area.dart';

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
          child: const MemberInfoArea(),
        ),
      ),
    );
  }
}