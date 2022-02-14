import 'package:flutter/material.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/widget/membership_actions_view.dart';
import 'package:wir_markt/preferences/preferences_page.dart';

import '../../impact_info/view/impact_content_view.dart';

/// Home page accessible if logged in
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
              icon: const Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: getTitleOf(page: 1),
              icon: const Icon(Icons.bar_chart)),
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
        return const MembershipActionsView();
      case 1:
        return const ImpactContentView();
      default:
        return Container();
    }
  }
}

