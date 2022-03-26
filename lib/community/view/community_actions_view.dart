import 'package:flutter/material.dart';
import 'package:wir_markt/wm_design.dart';

import '../../generated/l10n.dart';
import '../../partner/view/partners_view.dart';
import '../../recipe/view/recipes_view.dart';
import '../../utils/logical_size_utils.dart';
import '../../widgets/menu_button.dart';
import '../../widgets/responsive_sized_wrap.dart';

class CommunityActionsView extends StatelessWidget {
  const CommunityActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = [
      MenuButton(
        title: S.of(context).recipes,
        color: AppColors.lightGreen,
        onTap: () {
          Navigator.of(context).push(RecipesView.route());
        },
        image: const AssetImage("images/menu/011-curry.png"),
      ),
      MenuButton(
        title: S.of(context).partners,
        color: AppColors.orange,
        onTap: () {
          Navigator.of(context).push(PartnersView.route());
        },
        image: const AssetImage("images/menu/008-rafting.png"),
      ),
    ];

    return ResponsiveSizedWrap(
      children: cards,
      columnCount: {
        LogicalWidth.xs: 2,
        LogicalWidth.sm: 3,
      },
    );
  }
}
