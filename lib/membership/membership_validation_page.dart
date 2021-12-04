import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/membership/membership_model.dart';

class MembershipValidationPage extends StatefulWidget {
  final String title;

  const MembershipValidationPage({Key? key, required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MembershipValidationPageState();
  }
}

class MembershipValidationPageState extends State<MembershipValidationPage> {
  @override
  Widget build(BuildContext context) {
    Membership? _membership =
        Provider.of<MembershipModel>(context, listen: false).membership;

    var _body;

    if (_membership != null) {
      var size = math.min(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height) *
          0.8;

      _body = Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: CustomPaint(
                size: Size.square(size),
                painter: QrPainter(
                  data: _membership.qr,
                  color: Colors.black,
                  version: QrVersions.auto,
                ),
              ),
            ),
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
