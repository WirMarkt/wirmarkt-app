import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/impact_content_bloc.dart';
import '../repository/impact_content_repository.dart';
import 'impact_content_loader.dart';

class ImpactContentView extends StatelessWidget {
  const ImpactContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ImpactContentBloc(
          impactContentRepository:
              RepositoryProvider.of<ImpactContentRepository>(context),
        );
      },
      child: const ImpactContentLoader(),
    );
  }
}
