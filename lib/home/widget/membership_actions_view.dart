import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../member_id/view/member_id_page.dart';
import '../../recipe/view/recipes_view.dart';
import '../../share_owner_info/view/share_owner_info_page.dart';
import '../../suggest_product/view/suggest_product_page.dart';
import '../../training/view/take_training_page.dart';
import '../../upcoming_shift/view/upcoming_shift_page.dart';
import '../../utils/logical_size_utils.dart';
import '../../widgets/responsive_sized_wrap.dart';
import 'main_menu_button.dart';

class MembershipActionsView extends StatelessWidget {
  const MembershipActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = [
      MainMenuButton(
        title: S.of(context).badge,
        color: const Color.fromARGB(60, 197, 241, 152),
        onTap: () {
          Navigator.of(context).push(MemberInfoPage.route());
        },
        image: const AssetImage("images/menu/005-contract.png"),
      ),
      MainMenuButton(
        title: S.of(context).suggestProduct,
        color: const Color.fromARGB(60, 255, 255, 100),
        onTap: () {
          Navigator.of(context).push(SuggestProductPage.route());
        },
        image: const AssetImage("images/menu/001-banana-milk.png"),
      ),
      MainMenuButton(
        title: S.of(context).training,
        color: const Color.fromARGB(60, 100, 100, 255),
        onTap: () {
          Navigator.of(context)
              .push(TakeTrainingPage.route(trainingName: "intro"));
        },
        image: const AssetImage("images/menu/002-wisdom.png"),
      ),
      MainMenuButton(
        title: S.of(context).upcomingShift,
        color: const Color.fromARGB(60, 255, 100, 100),
        onTap: () {
          Navigator.of(context).push(UpcomingShiftPage.route());
        },
        image: const AssetImage("images/menu/004-wristwatch.png"),
      ),
      MainMenuButton(
        title: S.of(context).recipes,
        color: const Color.fromARGB(60, 128, 205, 194),
        onTap: () {
          Navigator.of(context).push(RecipesView.route());
        },
        image: const AssetImage("images/menu/011-curry.png"),
      ),
      MainMenuButton(
        title: S.of(context).membership,
        color: const Color.fromARGB(60, 212, 38, 164),
        onTap: () {
          Navigator.of(context).push(ShareOwnerInfoPage.route());
        },
        image: const AssetImage("images/menu/007-social-network.png"),
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
