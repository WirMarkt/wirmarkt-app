import 'package:flutter/material.dart';

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
  const MembershipActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = [
      MenuButton(
        title: S.of(context).badge,
        color: const Color.fromARGB(60, 197, 241, 152),
        onTap: () {
          Navigator.of(context).push(PosIdPage.route());
        },
        image: const AssetImage("images/menu/005-contract.png"),
      ),
      MenuButton(
        title: S.of(context).suggestProduct,
        color: const Color.fromARGB(60, 255, 255, 100),
        onTap: () {
          Navigator.of(context).push(SuggestProductPage.route());
        },
        image: const AssetImage("images/menu/001-banana-milk.png"),
      ),
      MenuButton(
        title: S.of(context).training,
        color: const Color.fromARGB(60, 100, 100, 255),
        onTap: () {
          Navigator.of(context)
              .push(TakeTrainingPage.route(trainingName: "intro"));
        },
        image: const AssetImage("images/menu/002-wisdom.png"),
      ),
      MenuButton(
        title: S.of(context).upcomingShift,
        color: const Color.fromARGB(60, 255, 100, 100),
        onTap: () {
          Navigator.of(context).push(UpcomingShiftPage.route());
        },
        image: const AssetImage("images/menu/004-wristwatch.png"),
      ),
      MenuButton(
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
