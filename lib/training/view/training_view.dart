import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../generated/l10n.dart';
import '../../widgets/icon_placeholder_image.dart';
import '../model/answer.dart';
import '../model/question.dart';
import '../model/training.dart';
import '../model/training_section.dart';
import '../repository/training_repository.dart';

const _padding = 16.0;

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
    var widgets = [
      _TrainingIntro(
          training: widget.training, translation: widget.translation),
      ...widget.training.contents.map((content) {
        return _generateWidget(content);
      }),
    ];
    return SafeArea(
      child: PageView(
        children: widgets.map((widget) {
          return LayoutBuilder(builder: (context, constraints) {
            const double maxContentWidth = 800;
            if (constraints.maxWidth > maxContentWidth) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: maxContentWidth,
                    child: SingleChildScrollView(child: widget),
                  ),
                  Spacer(),
                ],
              );
            } else {
              return SingleChildScrollView(child: widget);
            }
          });
        }).toList(),
      ),
    );
  }

  Widget _generateWidget(TrainingContent content) {
    if (content is Question) {
      return _QuestionView(content);
    } else if (content is TrainingSection) {
      return _TrainingSectionView(content);
    } else {
      return Container();
    }
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView(
    this.question, {
    Key? key,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var translatedQuestion = question.getTranslationForLocale();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(_padding),
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
              question: question,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrainingSectionView extends StatelessWidget {
  const _TrainingSectionView(
    this.trainingSection, {
    Key? key,
  }) : super(key: key);

  final TrainingSection trainingSection;

  @override
  Widget build(BuildContext context) {
    var repo = RepositoryProvider.of<TrainingRepository>(context);

    var textTheme = Theme.of(context).textTheme;
    var translatedTrainingSection =
        trainingSection.getTranslationForLocaleOrNull();
    String? introHtml = translatedTrainingSection?.introduction;
    String? keyTakeaways = translatedTrainingSection?.keyTakeaways;
    var htmlStyle = {
      'h1,h2,h3': Style(
        fontFamily: textTheme.titleLarge!.fontFamily!,
        fontWeight: FontWeight.normal,
        fontSize: FontSize(textTheme.titleLarge!.fontSize!, units: "px"),
        margin: const EdgeInsets.only(top: 32, bottom: 16, left: 8, right: 8),
      ),
      'li,p': Style(
        fontFamily: "Inter",
        fontSize: FontSize(textTheme.bodyLarge!.fontSize!, units: "px"),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      ),
    };
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (trainingSection.coverImage != null)
          Padding(
            padding: const EdgeInsets.all(_padding),
            child: Card(
              child: IconPlaceholderImage.network(
                repo.getAssetUrl(trainingSection.coverImage!,
                    presetKey: "cover"),
                aspectRatio: 3,
                fit: BoxFit.cover,
                icon: Icons.image,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(_padding),
          child: Text(
            translatedTrainingSection?.title ?? S.of(context).untitled,
            style: textTheme.headlineSmall,
          ),
        ),
        if (introHtml != null) ...[
          Html(data: introHtml, style: htmlStyle),
          SizedBox(height: 16),
        ],
        if (keyTakeaways != null) ...[
          Html(data: keyTakeaways, style: htmlStyle),
          SizedBox(height: 16),
        ],
      ],
    );
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (training.coverImage != null)
          Padding(
            padding: const EdgeInsets.all(_padding),
            child: Card(
              child: IconPlaceholderImage.network(
                repo.getAssetUrl(training.coverImage!, presetKey: "cover"),
                aspectRatio: 2,
                icon: Icons.image,
              ),
            ),
          ),
        const SizedBox(height: _padding),
        if (translation != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(translation!.title, style: textTheme.titleLarge),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding),
            child: Text(translation!.description, style: textTheme.bodyLarge),
          ),
        ],
        const SizedBox(height: _padding),
      ],
    );
  }
}
