import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../member_contribution/view/manage_contribution_page.dart';
import '../../member_info/view/member_info_page.dart';
import '../../recipe/view/recipes_page.dart';
import '../../suggest_product/view/suggest_product_page.dart';
import '../../training/view/take_training_page.dart';
import 'onboarding_card.dart';

class MembershipActionsView extends StatelessWidget {
  const MembershipActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cards = [
      OnboardingCard(
        title: S.of(context).showMembershipID,
        color: const Color.fromARGB(60, 255, 255, 210),
        onTap: () {
          Navigator.of(context).push(MemberInfoPage.route());
        },
        image: const AssetImage("images/menu/005-contract.png"),
      ),
      OnboardingCard(
        title: S.of(context).createProductSuggestionTitle,
        color: const Color.fromARGB(60, 255, 255, 100),
        onTap: () {
          Navigator.of(context).push(SuggestProductPage.route());
        },
        image: const AssetImage("images/menu/001-banana-milk.png"),
      ),
      OnboardingCard(
        title: S.of(context).training,
        color: const Color.fromARGB(60, 100, 100, 255),
        onTap: () {
          Navigator.of(context)
              .push(TakeTrainingPage.route(trainingName: "intro"));
        },
        image: const AssetImage("images/menu/002-wisdom.png"),
      ),
      OnboardingCard(
        title: S.of(context).nextShift,
        color: const Color.fromARGB(60, 255, 100, 100),
        onTap: () {
          Navigator.of(context).push(ManageContributionPage.route());
        },
        image: const AssetImage("images/menu/004-wristwatch.png"),
      ),
      OnboardingCard(
        title: S.of(context).recipes,
        color: const Color.fromARGB(60, 128, 205, 194),
        onTap: () {
          Navigator.of(context).push(RecipesView.route());
        },
        image: const AssetImage("images/menu/011-curry.png"),
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          const outerPadding = 8.0;
          var size = constraints.maxWidth / 2 - outerPadding;
          return Padding(
            padding: const EdgeInsets.all(outerPadding),
            child: Wrap(
              children: cards.map((card) {
                return SizedBox(
                  width: size,
                  height: size,
                  child: card,
                );
              }).toList(),
            ),
          );
        }),
      ),
    );
  }
}
