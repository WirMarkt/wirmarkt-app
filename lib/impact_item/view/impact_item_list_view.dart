import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logical_size_utils.dart';
import '../../widgets/responsive_sized_wrap.dart';
import '../model/impact_item.dart';
import '../repository/impact_item_repository.dart';
import '../widget/impact_card.dart';

class ImpactItemListView extends StatelessWidget {
  final List<ImpactItem> impactItems;

  const ImpactItemListView({super.key, required this.impactItems});

  @override
  Widget build(BuildContext context) {
    var cards =
        impactItems.where((x) => x.hasTranslationForLocale()).map((impactItem) {
      ImpactItemTranslation? translation = impactItem.getTranslationForLocale();
      var repo = RepositoryProvider.of<ImpactItemRepository>(context);
      var cardColor =
          impactItem.backgroundColor ?? const Color.fromRGBO(167, 223, 210, 1);
      return ImpactCard(
        title: translation.title,
        explanation: translation.subtext,
        imageUrl: repo.getAssetUrl(impactItem.coverImage, presetKey: "cover"),
        backgroundColor: cardColor.withAlpha(50),
        fit: BoxFit.contain,
      );
    }).toList();

    return ResponsiveSizedWrap(
      children: cards,
      columnCount: {
        LogicalWidth.xs: 1,
        LogicalWidth.sm: 2,
      },
    );
  }
}
