import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/wm_design.dart';

import '../model/training.dart';
import '../repository/training_repository.dart';

class TrainingView extends StatelessWidget {
  final Training training;

  const TrainingView({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    TrainingTranslation? translation;
    try {
      //TODO fall back to english if translation unavailable
      translation = training.getTranslationForLocale();
    } on StateError {
      translation = null;
    }

    var repo = RepositoryProvider.of<TrainingRepository>(context);

    var textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: paddingVertical),
          if (training.coverImage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: WMDesign.defaultElevation,
                  child: Column(
                    children: [
                      Image(
                          image: NetworkImage(repo.getAssetUrl(
                              training.coverImage!,
                              presetKey: "cover"))),
                    ],
                  )),
            ),
          if (translation != null) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(translation.title, style: textTheme.headline4),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(translation.description, style: textTheme.subtitle1),
            ),
          ],
          ...training.contents.map((content) {
            if (content is Question) {
              var translatedQuestion = content.getTranslationForLocale();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: WMDesign.defaultElevation,
                  color: WMDesign.lightGreen,
                  child: ListTile(
                    leading: const Icon(Icons.question_answer_outlined),
                    title: Text(
                      translatedQuestion.text,
                      style: textTheme.headline6,
                    ),
                  ),
                ),
              );
            } else if (content is TrainingSection) {
              var translatedTrainingSection = content.getTranslationForLocaleOrNull();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: WMDesign.defaultElevation,
                  color: WMDesign.white,
                  child: ListTile(
                    leading: const Icon(Icons.info_outlined),
                    title: Text(
                      translatedTrainingSection?.title ?? "Untitled",
                      style: textTheme.headline6,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
          const SizedBox(height: paddingVertical * 2),
        ],
      ),
    );
  }
}
