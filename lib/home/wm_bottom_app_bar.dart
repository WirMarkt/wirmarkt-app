import 'package:flutter/material.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/preferences/preferences_page.dart';

class WMBottomAppBar extends StatefulWidget {
  const WMBottomAppBar({
    this.shape = const CircularNotchedRectangle(),
  });

  final NotchedShape? shape;

  @override
  State<WMBottomAppBar> createState() => _WMBottomAppBarState();
}

class _WMBottomAppBarState extends State<WMBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: widget.shape,
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: S.of(context).settingsTitle,
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => PreferencesPage(),
                ));
              });
            },
          ),
          const Spacer(),
          // IconButton(
          //   tooltip: 'Search',
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   tooltip: 'Favorite',
          //   icon: const Icon(Icons.favorite),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
