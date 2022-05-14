import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/impact_item_bloc.dart';
import '../repository/impact_item_repository.dart';
import 'impact_item_loader.dart';

class ImpactItemView extends StatelessWidget {
  const ImpactItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ImpactItemBloc(
          impactItemRepository:
              RepositoryProvider.of<ImpactItemRepository>(context),
        );
      },
      child: const ImpactItemLoader(),
    );
  }
}
