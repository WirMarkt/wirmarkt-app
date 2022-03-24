import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../bloc/partner_bloc.dart';
import '../repository/partner_repository.dart';
import 'partner_loader.dart';

class PartnersView extends StatelessWidget {
  static Route<Object?> route() {
    return MaterialPageRoute<void>(builder: (_) => const PartnersView());
  }

  const PartnersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).partners),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 800,
              ),
              child: BlocProvider(
                create: (context) {
                  return PartnerBloc(
                    partnerRepository:
                        RepositoryProvider.of<PartnerRepository>(context),
                  );
                },
                child: const PartnerLoader(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
