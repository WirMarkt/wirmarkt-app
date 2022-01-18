import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wir_markt/generated/l10n.dart';

class MemberInfoColumn extends StatelessWidget {
  final String qrCode;

  const MemberInfoColumn({
    Key? key,
    required this.qrCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FittedBox(
                  child: CustomPaint(
                    size: const Size(1000,1000),
                    painter: QrPainter(
                      data: qrCode,
                      color: Colors.black,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Text(S.of(context).showBarcodeAtPOSLabel,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ),
        ],
      ),
    );
  }
}
