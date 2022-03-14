import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'share_owner_info_area.dart';

class ShareOwnerInfoPage extends StatelessWidget {
  const ShareOwnerInfoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ShareOwnerInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).membershipTitle)),
      body: const SafeArea(child: ShareOwnerInfoArea()),
    );
  }
}