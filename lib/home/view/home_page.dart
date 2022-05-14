import 'package:flutter/material.dart';

import '../../community/view/community_actions_view.dart';
import '../../generated/l10n.dart';
import '../../impact_item/view/impact_item_view.dart';
import '../../membership/view/membership_actions_view.dart';
import '../../preferences/preferences_page.dart';

/// Home page accessible if logged in
class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

enum Pages { membership, community, impact }

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
              case Pages.community:
                return Text(S.of(context).communitySectionTitle);
              case Pages.impact:
                return Text(S.of(context).impactSectionTitle);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: showPreferences,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 800,
              ),
              child: Builder(builder: (context) {
                switch (_page) {
                  case Pages.membership:
                    return const MembershipActionsView();
                  case Pages.community:
                    return const CommunityActionsView();
                  case Pages.impact:
                    return const ImpactItemView();
                }
              }),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page.index,
        items: [
          BottomNavigationBarItem(
            label: S.of(context).membershipSectionTitle,
            icon: const Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: S.of(context).communitySectionTitle,
            icon: const Icon(Icons.people),
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
