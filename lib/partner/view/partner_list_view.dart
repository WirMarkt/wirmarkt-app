import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/partner.dart';
import '../repository/partner_repository.dart';
import '../widget/partner_card.dart';

class PartnerListView extends StatelessWidget {
  final List<Partner> partners;

  const PartnerListView({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    var cards =
        partners.where((x) => x.hasTranslationForLocale()).map((partner) {
      PartnerTranslation? translation = partner.getTranslationForLocale();
      var repo = RepositoryProvider.of<PartnerRepository>(context);
      return PartnerCard(
        title: partner.organizationName,
        explanation: translation.partnershipDescription,
        imageUrl: repo.getAssetUrl(partner.coverImage, presetKey: "cover"),
        photoUrlList: partner.photos
            .map(
                (file) => repo.getAssetUrl(file.fileId, presetKey: "thumbnail"))
            .toList(),
      );
    }).toList();

    return Wrap(
      spacing: 36,
      children: cards,
    );
  }
}
