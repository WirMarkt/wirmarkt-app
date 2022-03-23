import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'member_id_area.dart';

class MemberInfoPage extends StatelessWidget {
  const MemberInfoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MemberInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).membership)),
      body: SafeArea(
          child: Center(
              child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 800,
        ),
        child: MemberInfoArea(),
      ))),
    );
  }
}
