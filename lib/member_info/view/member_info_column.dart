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
            var allowedToShop = memberInfo.allowedToShop == true;

            return Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  child: _MemberIDDetails(
                      allowedToShop: allowedToShop, qrCode: memberInfo.idQrCode),
                ),
                Expanded(
                  child: _AllowedToShopDetails(allowedToShop: allowedToShop),
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
    required this.allowedToShop,
    required this.qrCode,
  }) : super(key: key);

  final bool allowedToShop;
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
              color: allowedToShop ? Colors.white : Colors.redAccent,
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

class _AllowedToShopDetails extends StatelessWidget {
  const _AllowedToShopDetails({
    Key? key,
    required this.allowedToShop,
  }) : super(key: key);

  final bool allowedToShop;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    String allowedToShopDetails;

    if (allowedToShop) {
      icon = const Icon(
        Icons.check_circle,
        color: WMDesign.lightGreen,
      );
      allowedToShopDetails = S.of(context).allowedToShopAsMember;
    } else {
      icon = const Icon(
        Icons.report_problem,
        color: WMDesign.orange,
      );
      allowedToShopDetails = S.of(context).notAllowedToShop;
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
          child: Text(allowedToShopDetails,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    );
  }
}
