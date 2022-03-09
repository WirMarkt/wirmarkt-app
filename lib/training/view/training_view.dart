import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../generated/l10n.dart';
import '../../widgets/icon_placeholder_image.dart';
import '../../wm_design.dart';
import '../model/training.dart';
import '../repository/training_repository.dart';

const paddingVertical = 16.0;

class TrainingView extends StatefulWidget {
  final Training training;
  late final TrainingTranslation? translation;

  TrainingView({Key? key, required this.training}) : super(key: key) {
    try {
      translation = training.getTranslationForLocale();
    } on StateError {
      translation = null;
    }
  }

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  late Widget _widget;
  int _index = -1;

  @override
  void initState() {
    super.initState();

    _widget = _TrainingIntro(
        key: const ValueKey(-1),
        training: widget.training,
        translation: widget.translation);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _widget,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _index =
                      math.min(_index + 1, widget.training.contents.length - 1);
                  _widget = _generateWidget(
                      widget.training.contents[_index], ValueKey(_index));
                });
              },
              child: Text(S.of(context).continueLabel)),
          const SizedBox(height: paddingVertical * 2),
        ],
      ),
    );
  }

  Widget _generateWidget(TrainingContent content, Key? key) {
    var repo = RepositoryProvider.of<TrainingRepository>(context);

    var textTheme = Theme.of(context).textTheme;
    if (content is Question) {
      var translatedQuestion = content.getTranslationForLocale();
      return Padding(
        key: key,
        padding: const EdgeInsets.all(8.0),
        child: Card(
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
      return Wrap(
        key: key,
        children: [
          Wrap(
            children: [
              const Divider(thickness: 3),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  translatedTrainingSection?.title ?? "Untitled",
                  style: textTheme.headline6,
                ),
              ),
              if (content.coverImage != null)
                IconPlaceholderImage.network(
                  repo.getAssetUrl(content.coverImage!, presetKey: "cover"),
                  aspectRatio: 2,
                  icon: Icons.image,
                ),
              Html(data: translatedTrainingSection?.introduction),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

class _TrainingIntro extends StatelessWidget {
  const _TrainingIntro({
    Key? key,
    required this.training,
    required this.translation,
  }) : super(key: key);

  final Training training;
  final TrainingTranslation? translation;

  @override
  Widget build(BuildContext context) {
    var repo = RepositoryProvider.of<TrainingRepository>(context);

    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        if (training.coverImage != null)
          IconPlaceholderImage.network(
            repo.getAssetUrl(training.coverImage!, presetKey: "cover"),
            aspectRatio: 2,
            icon: Icons.image,
          ),
        const SizedBox(height: paddingVertical),
        if (translation != null) ...[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(translation!.title, style: textTheme.headline4),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(translation!.description, style: textTheme.subtitle1),
          ),
        ],
        const SizedBox(height: paddingVertical),
        // ...training.contents.map((content) {
        //   if (content is TrainingSection) {
        //     return OnboardingCard(
        //       iconImage: NetworkImage(
        //           repo.getAssetUrl(content.coverImage!, presetKey: "cover")),
        //       title: content.getTranslationForLocale().title,
        //     );
        //   } else if (content is Question) {
        //     return OnboardingCard(
        //       iconImage: NetworkImage(
        //           repo.getAssetUrl(training.coverImage!, presetKey: "cover")),
        //       title: content.getTranslationForLocale().text,
        //     );
        //   } else {
        //     return Container();
        //   }
        // }),
      ],
    );
  }
}
