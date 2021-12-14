import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/impact_card.dart';
import 'package:wir_markt/home/onboarding_card.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/membership/validate_membership_page.dart';
import 'package:wir_markt/scan/scan_code_page.dart';
import 'package:wir_markt/suggest_product/suggest_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(getTitleOf(page: _page)),
        // leading: IconButton(
        //   icon: const Icon(Icons.person),
        //   onPressed: profileClicked,
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: paddingVertical),
            if (_page == 0) ...generateShoppingCartUI(),
            if (_page == 1) ...generateImpactUI(),
            const SizedBox(height: paddingVertical * 2),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
              label: getTitleOf(page: 0),
              icon: const Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: getTitleOf(page: 1), icon: const Icon(Icons.insights)),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }

  void profileClicked() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ValidateMembershipPage(
          title: S.of(context).membershipTitle,
        ),
      ),
    );
  }

  List<Widget> generateShoppingCartUI() => [
        OnboardingCard(
          title: S.of(context).createAssortmentSuggestionTitle,
          explanation: S.of(context).createAssortmentSuggestionExplanation,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => SuggestProductPage(
                    instructionsText:
                        S.of(context).suggestAssortmentInstructionText,
                    title: S.of(context).createAssortmentSuggestionTitle),
              ),
            );
          },
          iconImage: const AssetImage("images/fridge.jpg"),
          //TODO this should be dynamic
          done: false,
        ),
        OnboardingCard(
          title: S.of(context).createProductSuggestionTitle,
          explanation: S.of(context).createProductSuggestionExplanation,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => SuggestProductPage(
                  title: S.of(context).createProductSuggestionTitle,
                  instructionsText: S.of(context).suggestProductInstructionText,
                ),
              ),
            );
          },
          iconImage: const AssetImage("images/produce.jpg"),
          //TODO this should be dynamic
          done: false,
        ),
        Consumer<MembershipModel>(
          builder: (_, model, child) {
            if (model.membership == null) {
              return OnboardingCard(
                title: S.of(context).setupMembershipTitle,
                explanation: S.of(context).setupMembershipExplanation,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ScanCodePage(
                        title: S.of(context).setupMembershipTitle,
                        explanation:
                            S.of(context).scanMembershipBarcodeExplanation,
                        onCapture: (data) {
                          //TODO validate scanned code
                          var membership = Membership(data);
                          Provider.of<MembershipModel>(context, listen: false)
                              .updateMembership(membership);
                          Navigator.of(context).pop(membership);
                        },
                      ),
                    ),
                  );
                },
                iconImage: const AssetImage("images/member-card.jpg"),
              );
            } else {
              return Column(
                children: [
                  OnboardingCard(
                    title: S.of(context).shopAsMemberTitle,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              ValidateMembershipPage(
                                  title: S.of(context).shopAsMemberTitle),
                        ),
                      );
                    },
                    //TODO this should be dynamic
                    done: false,
                    iconImage: const AssetImage("images/orange-bag.jpg"),
                  ),
                  OnboardingCard(
                    title: S.of(context).planContributionTitle,
                    explanation: S.of(context).planContributionExplanation,
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) =>
                      //         ValidateMembershipPage(
                      //             title: S.of(context).shopAsMemberTitle),
                      //   ),
                      // );
                    },
                    //TODO this should be dynamic
                    done: false,
                    iconImage: const AssetImage("images/cashier.jpg"),
                  ),
                ],
              );
            }
          },
        ),
      ];

  List<Widget> generateImpactUI() {
    //TODO make this dynamic
    var _membershipCount = 63;
    var _storeCount = 1;
    return [
      ImpactCard(
        title: S.of(context).membershipCountTitle(_membershipCount),
        explanation: S.of(context).membershipCountExplanation,
        image: const AssetImage("images/member-card.jpg"),
      ),
      ImpactCard(
        title: S.of(context).storeCountTitle(_storeCount),
        explanation: S.of(context).storeCountExplanation,
        image: const AssetImage("images/cashier.jpg"),
      ),
    ];
  }

  String getTitleOf({required int page}) {
    switch (page) {
      case 0:
        return S.of(context).membershipSectionTitle;
      case 1:
        return S.of(context).impactSectionTitle;
      default:
        return "WirMarkt";
    }
  }
}
