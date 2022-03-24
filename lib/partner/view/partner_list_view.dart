import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logical_size_utils.dart';
import '../../widgets/responsive_sized_wrap.dart';
import '../model/partner.dart';
import '../repository/partner_repository.dart';
import '../widget/partner_card.dart';

class PartnerListView extends StatelessWidget {
  final List<Partner> partners;

  const PartnerListView({Key? key, required this.partners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards =
        partners.where((x) => x.hasTranslationForLocale()).map((partner) {
      PartnerTranslation? translation = partner.getTranslationForLocale();
      var repo = RepositoryProvider.of<PartnerRepository>(context);
      var cardColor = const Color.fromRGBO(167, 223, 210, 1);
      return PartnerCard(
        title: partner.organizationName,
        explanation: translation.partnershipDescription,
        imageUrl: repo.getAssetUrl(partner.coverImage, presetKey: "cover"),
        backgroundColor: cardColor.withAlpha(50),
        fit: BoxFit.contain,
        photoUrlList: partner.photos.map((file)=>repo.getAssetUrl(file.fileId, presetKey: "thumbnail")).toList(),
      );
    }).toList();

    return ResponsiveSizedWrap(
      children: cards,
      aspectRatio: 1.4,
      columnCount: {
        LogicalWidth.xs: 1,
        LogicalWidth.sm: 2,
      },
    );
  }
}
