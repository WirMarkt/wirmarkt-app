import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_info/model/member_info.dart';
import 'package:wir_markt/wm_design.dart';

class MemberInfoColumn extends StatelessWidget {
  final MemberInfo memberInfo;

  const MemberInfoColumn({
    Key? key,
    required this.memberInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            var canShop = memberInfo.canShop == true;

            return Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  child: _CanShopDetails(canShop: canShop),
                ),
                Expanded(
                  child: _MemberIDDetails(
                      canShop: canShop, qrCode: memberInfo.idQrCode),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MemberIDDetails extends StatelessWidget {
  const _MemberIDDetails({
    Key? key,
    required this.canShop,
    required this.qrCode,
  }) : super(key: key);

  final bool canShop;
  final String qrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              color: canShop ? Colors.white : Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FittedBox(
                  child: CustomPaint(
                    size: const Size(1000, 1000),
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
        ),
        Expanded(
          child: Text(S.of(context).showBarcodeAtPOSLabel,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    );
  }
}

class _CanShopDetails extends StatelessWidget {
  const _CanShopDetails({
    Key? key,
    required this.canShop,
  }) : super(key: key);

  final bool canShop;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    String canShopDetails;

    if (canShop) {
      icon = const Icon(
        Icons.check_circle,
        color: WMDesign.lightGreen,
      );
      canShopDetails = "Du kannst als Mitglied im Laden einkaufen";
    } else {
      icon = const Icon(
        Icons.report_problem,
        color: WMDesign.orange,
      );
      canShopDetails = "Derzeit kannst du nicht im Laden einkaufen.";
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: FittedBox(
            child: icon,
          ),
        ),
        Expanded(
          child: Text(canShopDetails,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    );
  }
}
