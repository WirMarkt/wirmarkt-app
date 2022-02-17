import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../member_contribution/view/manage_contribution_page.dart';
import '../../member_info/view/member_info_page.dart';
import '../../suggest_product/view/suggest_product_page.dart';
import '../../training/view/take_training_page.dart';
import 'onboarding_card.dart';

class MembershipActionsView extends StatelessWidget {
  const MembershipActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: paddingVertical),
            OnboardingCard(
              title: S.of(context).showMembershipID,
              onTap: () {
                Navigator.of(context).push(MemberInfoPage.route());
              },
              iconImage: const AssetImage("images/shop_as_member.jpg"),
            ),
            OnboardingCard(
              title: S.of(context).planContributionTitle,
              explanation: S.of(context).planContributionExplanation,
              onTap: () {
                Navigator.of(context).push(ManageContributionPage.route());
              },
              iconImage:
                  const AssetImage("images/plan_member_contribution.jpg"),
            ),
            OnboardingCard(
              title: S.of(context).createProductSuggestionTitle,
              explanation: S.of(context).createProductSuggestionExplanation,
              onTap: () {
                Navigator.of(context).push(SuggestProductPage.route());
              },
              iconImage: const AssetImage("images/add_product_wish.jpg"),
              //TODO this should be dynamic
              done: false,
            ),
            OnboardingCard(
              title: S.of(context).training,
              explanation: S.of(context).prepareForFirstShift,
              onTap: () {
                Navigator.of(context)
                    .push(TakeTrainingPage.route(trainingName: "intro"));
              },
              iconImage: const AssetImage("images/training.jpg"),
              //TODO this should be dynamic
              done: false,
            ),
            const SizedBox(height: paddingVertical * 2),
          ],
        ),
      ),
    );
  }
}
