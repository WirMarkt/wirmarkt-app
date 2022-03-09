import 'package:flutter/material.dart';
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

enum Pages { membership, impact }

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Pages _page = Pages.membership;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Builder(
          builder: (context) {
            switch (_page) {
              case Pages.membership:
                return Text(S.of(context).membershipSectionTitle);
              case Pages.impact:
                return Text(S.of(context).impactSectionTitle);
            }
          },
        ),
        actions: [IconButton(
          icon: const Icon(Icons.settings),
          onPressed: showPreferences,
        )],
      ),
      body: Builder(builder: (context) {
        switch (_page) {
          case Pages.membership:
            return const MembershipActionsView();
          case Pages.impact:
            return const ImpactContentView();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page.index,
        items: [
          BottomNavigationBarItem(
            label: S.of(context).membershipSectionTitle,
            icon: const Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: S.of(context).impactSectionTitle,
            icon: const Icon(Icons.bar_chart),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = Pages.values[index];
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
}
