

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/impact_content.dart';
import '../repository/impact_content_repository.dart';
import '../widget/impact_card.dart';

class ImpactContentColumn extends StatelessWidget {
  final List<ImpactContent> impactContents;

  const ImpactContentColumn({Key? key, required this.impactContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    return Column(
      children: [
        const SizedBox(height: paddingVertical),
        ...impactContents
            .where((x) => x.hasTranslationForLocale())
            .map((impactContent) {
          ImpactContentTranslation? translation =
          impactContent.getTranslationForLocale();
          var repo = RepositoryProvider.of<ImpactContentRepository>(context);
          return ImpactCard(
            title: translation.title,
            explanation: translation.subtext,
            image: NetworkImage(
                repo.getAssetUrl(impactContent.coverImage, presetKey: "cover")),
            backgroundColor: const Color.fromRGBO(167, 223, 210, 1),
            textColor: Colors.black,
            fit: BoxFit.contain,
          );
        }),
        const SizedBox(height: paddingVertical * 2),
      ],
    );
  }
}
