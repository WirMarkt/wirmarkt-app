import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/widget/onboarding_card.dart';
import 'package:wir_markt/impact/widget/impact_column.dart';
import 'package:wir_markt/member_contribution/view/manage_contribution_page.dart';
import 'package:wir_markt/member_info/view/member_info_page.dart';
import 'package:wir_markt/preferences/preferences_page.dart';
import 'package:wir_markt/suggest_product/view/suggest_product_page.dart';

/// Home page accessible if logged in
/// See [BaseScreen]
class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: buildPageUi(_page),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
              label: getTitleOf(page: 0),
              icon: const Icon(CupertinoIcons.shopping_cart)),
          BottomNavigationBarItem(
              label: getTitleOf(page: 1),
              icon: const Icon(CupertinoIcons.tree)),
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

    //TODO put in separate widget
    return Column(
      children: [
        const SizedBox(height: paddingVertical),
        Column(
          children: [
            OnboardingCard(
              title: S.of(context).shopAsMemberTitle,
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
              iconImage: const AssetImage("images/plan_member_contribution.jpg"),
            ),
          ],
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
          iconImage: const AssetImage("images/add_assortment_wish.jpg"),
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
          iconImage: const AssetImage("images/add_product_wish.jpg"),
          //TODO this should be dynamic
          done: false,
        ),
        const SizedBox(height: paddingVertical * 2),
      ],
    );
  }

  String getTitleOf({required int page}) {
    switch (page) {
      case 0:
        return S.of(context).membershipSectionTitle;
      case 1:
        return S.of(context).impactSectionTitle;
      default:
        return AppConfig.get().orgName;
    }
  }

  Widget buildPageUi(int page) {
    switch (page) {
      case 0:
        return generateShoppingCartUI();
      case 1:
        return const ImpactColumn();
      default:
        return Container();
    }
  }
}

