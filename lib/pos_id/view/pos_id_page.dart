import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'pos_id_area.dart';

class PosIdPage extends StatelessWidget {
  const PosIdPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const PosIdPage());
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
        child: PosIdArea(),
      ))),
    );
  }
}
