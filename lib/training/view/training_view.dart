import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../widgets/icon_placeholder_image.dart';
import '../model/answer.dart';
import '../model/question.dart';
import '../model/training.dart';
import '../model/training_section.dart';
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
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: _TrainingIntro(
                training: widget.training, translation: widget.translation),
          ),
        ),
        ...widget.training.contents.map((content) {
          return _generateWidget(content);
        }),
      ],
    );
  }

  Widget _generateWidget(TrainingContent content, [Key? key]) {
    var repo = RepositoryProvider.of<TrainingRepository>(context);

    var textTheme = Theme.of(context).textTheme;
    if (content is Question) {
      var translatedQuestion = content.getTranslationForLocale();
      return Padding(
        key: key,
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.question_answer_outlined, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        translatedQuestion.text,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 16,
                ),
                child: _AnswerSelectionColumn(
                  question: content,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (content is TrainingSection) {
      var translatedTrainingSection = content.getTranslationForLocaleOrNull();
      String? introHtml = translatedTrainingSection?.introduction;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            child: Wrap(
              key: key,
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        translatedTrainingSection?.title ?? "Untitled",
                        style: textTheme.headline6,
                      ),
                    ),
                    if (content.coverImage != null)
                      IconPlaceholderImage.network(
                        repo.getAssetUrl(content.coverImage!,
                            presetKey: "cover"),
                        aspectRatio: 2,
                        icon: Icons.image,
                      ),
                    if (introHtml != null) Html(data: introHtml),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class _AnswerSelectionColumn extends StatefulWidget {
  final Question question;

  const _AnswerSelectionColumn({
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  State<_AnswerSelectionColumn> createState() => _AnswerSelectionColumnState();
}

class _AnswerSelectionColumnState extends State<_AnswerSelectionColumn> {
  Answer? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.question.answers.map((answer) {
          var translatedAnswer = answer.getTranslationForLocale();

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Radio(
                  value: answer,
                  groupValue: _selectedAnswer,
                  onChanged: (_) {
                    setState(() {
                      _selectedAnswer = answer;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedAnswer = answer;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      translatedAnswer.text,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
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
      ],
    );
  }
}
