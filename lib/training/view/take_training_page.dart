import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/training/bloc/training_bloc.dart';

import '../../generated/l10n.dart';
import '../repository/training_repository.dart';
import 'training_loader.dart';

class TakeTrainingPage extends StatelessWidget {
  final String trainingName;

  static Route<Object?> route({required String trainingName}) {
    return MaterialPageRoute<void>(
        builder: (_) => TakeTrainingPage(trainingName: trainingName));
  }

  const TakeTrainingPage({Key? key, required this.trainingName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).takeTraining),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 800,
            ),
            child: BlocProvider(
              create: (context) {
                return TrainingBloc(
                  trainingRepository:
                      RepositoryProvider.of<TrainingRepository>(context),
                );
              },
              child: TrainingLoader(trainingName),
            ),
          ),
        ),
      ),
    );
  }
}
