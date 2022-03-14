import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/impact_content.dart';
import '../repository/impact_content_repository.dart';
import '../widget/impact_card.dart';

class ImpactContentListView extends StatelessWidget {
  final List<ImpactContent> impactContents;

  const ImpactContentListView({Key? key, required this.impactContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: paddingVertical),
            ...impactContents
                .where((x) => x.hasTranslationForLocale())
                .map((impactContent) {
              ImpactContentTranslation? translation =
                  impactContent.getTranslationForLocale();
              var repo =
                  RepositoryProvider.of<ImpactContentRepository>(context);
              var cardColor = impactContent.backgroundColor ??
                  const Color.fromRGBO(167, 223, 210, 1);
              return ImpactCard(
                title: translation.title,
                explanation: translation.subtext,
                imageUrl: repo.getAssetUrl(impactContent.coverImage,
                    presetKey: "cover"),
                backgroundColor: cardColor.withAlpha(50),
                fit: BoxFit.contain,
              );
            }),
            const SizedBox(height: paddingVertical * 2),
          ],
        ),
      ),
    );
  }
}