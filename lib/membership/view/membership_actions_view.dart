import 'package:flutter/material.dart';
import 'package:wir_markt/wm_design.dart';

import '../../generated/l10n.dart';
import '../../pos_id/view/pos_id_page.dart';
import '../../share_owner_info/view/share_owner_info_page.dart';
import '../../suggest_product/view/suggest_product_page.dart';
import '../../training/view/take_training_page.dart';
import '../../upcoming_shift/view/upcoming_shift_page.dart';
import '../../utils/logical_size_utils.dart';
import '../../widgets/menu_button.dart';
import '../../widgets/responsive_sized_wrap.dart';

class MembershipActionsView extends StatelessWidget {
  const MembershipActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    var cards = [
      MenuButton(
        title: S.of(context).badge,
        color: AppColors.turquoise,
        onTap: () {
          Navigator.of(context).push(PosIdPage.route());
        },
        image: const AssetImage("images/menu/005-contract.png"),
      ),
      MenuButton(
        title: S.of(context).suggestProduct,
        color: AppColors.yellow,
        onTap: () {
          Navigator.of(context).push(SuggestProductPage.route());
        },
        image: const AssetImage("images/menu/001-banana-milk.png"),
      ),
      MenuButton(
        title: S.of(context).training,
        color: AppColors.lightGreen,
        onTap: () {
          Navigator.of(context)
              .push(TakeTrainingPage.route(trainingName: "intro"));
        },
        image: const AssetImage("images/menu/002-wisdom.png"),
      ),
      MenuButton(
        title: S.of(context).upcomingShift,
        color: AppColors.darkBlue,
        onTap: () {
          Navigator.of(context).push(UpcomingShiftPage.route());
        },
        image: const AssetImage("images/menu/004-wristwatch.png"),
      ),
      MenuButton(
        title: S.of(context).membership,
        color: AppColors.orange,
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
