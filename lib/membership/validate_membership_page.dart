import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/membership/membership_model.dart';

class ValidateMembershipPage extends StatefulWidget {
  final String title;

  const ValidateMembershipPage({Key? key, required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ValidateMembershipPageState();
  }
}

class ValidateMembershipPageState extends State<ValidateMembershipPage> {
  @override
  Widget build(BuildContext context) {
    //load membership and listen for updates (will trigger state update)
    Membership? _membership =
        Provider.of<MembershipModel>(context, listen: true).membership;

    var _body;

    if (_membership != null) {
      var qrSize = math.min(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height) *
          0.8;

      _body = Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(qrSize * 0.1),
                  child: CustomPaint(
                    size: Size.square(qrSize * 0.9),
                    painter: QrPainter(
                      data: _membership.qr,
                      color: Colors.black,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Text(S.of(context).showBarcodeAtPOSLabel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
              ),
            ),
            Spacer(),
          ],
        ),
      );
    } else {
      _body = Text("Membership missing");
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        //backgroundColor: WMColors.white,
        body: _body);
  }
}
