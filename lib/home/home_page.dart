import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/impact_card.dart';
import 'package:wir_markt/home/onboarding_card.dart';
import 'package:wir_markt/impact/impact_metrics_model.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/membership/validate_membership_page.dart';
import 'package:wir_markt/preferences/preferences_page.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(getTitleOf(page: _page)),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: showPreferences,
        ),
      ),
      body: SingleChildScrollView(
        child: buildPageUi(_page),
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

  void showPreferences() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const PreferencesPage(),
      ),
    );
  }

  Widget generateShoppingCartUI() {
    const paddingVertical = 16.0;

    return Column(
      children: [
        const SizedBox(height: paddingVertical),
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
                iconImage: const AssetImage("images/bird.jpg"),
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
                    iconImage: const AssetImage("images/peas.jpg"),
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
                    iconImage: const AssetImage("images/bird.jpg"),
                  ),
                ],
              );
            }
          },
        ),
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
          iconImage: const AssetImage("images/apples.jpg"),
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
          iconImage: const AssetImage("images/oranges.jpg"),
          //TODO this should be dynamic
          done: false,
        ),
        const SizedBox(height: paddingVertical * 2),
      ],
    );
  }

  Widget generateImpactUI() {
    const paddingVertical = 16.0;

    return Consumer<ImpactMetricsModel>(builder: (_, impactMetrics, child) {
      return Column(
        children: [
          const SizedBox(height: paddingVertical),
          if (impactMetrics.impactMetrics != null)
            ImpactCard(
              title: S.of(context).membershipCountTitle(
                  impactMetrics.impactMetrics!.memberCount),
              explanation: S.of(context).membershipCountExplanation,
              image: const AssetImage("images/bird.jpg"),
              backgroundColor: const Color.fromRGBO(189, 231, 221, 1),
              textColor: Colors.black,
            ),
          if (impactMetrics.impactMetrics != null)
            ImpactCard(
              title: S
                  .of(context)
                  .storeCountTitle(impactMetrics.impactMetrics!.storeCount),
              explanation: S.of(context).storeCountExplanation,
              image: const AssetImage("images/peas.jpg"),
              backgroundColor: const Color.fromRGBO(250, 231, 214, 1),
              textColor: Colors.black,
            ),
          ImpactCard(
            title: S.of(context).regionalwertPartnerTitle,
            explanation: S.of(context).regionalwertPartnerExplanation,
            image: const AssetImage("images/regionalwert-partner.webp"),
            backgroundColor: const Color.fromRGBO(167, 223, 210, 1),
            textColor: Colors.black,
          ),
          const SizedBox(height: paddingVertical * 2),
        ],
      );
    });
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

  Widget buildPageUi(int page) {
    switch (page) {
      case 0:
        return generateShoppingCartUI();
      case 1:
        return generateImpactUI();
      default:
        return Container();
    }
  }
}
