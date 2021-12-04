import 'package:flutter/material.dart';
import 'package:wir_markt/generated/l10n.dart';

class WMBottomAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WMBottomAppBar({
    this.shape = const CircularNotchedRectangle(),
    required this.scaffoldKey,
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
                widget.scaffoldKey.currentState!.openDrawer();
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
