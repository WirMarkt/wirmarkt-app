import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/data.dart';
import '../../generated/l10n.dart';
import '../../wm_design.dart';

class PosIdColumn extends StatelessWidget {
  final User user;

  const PosIdColumn({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final canShop = user.shareOwner?.canShop == true;

          var membershipQrCode = "membership-${user.shareOwner?.id}";
          // pad with flour-specific prefix / suffix
          membershipQrCode = ".F.029.F.$membershipQrCode.F.";

          return Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Expanded(
                child: _MemberIDDetails(
                    canShop: canShop, qrCode: membershipQrCode),
              ),
              Expanded(
                child: _AllowedToShopDetails(canShop: canShop),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MemberIDDetails extends StatelessWidget {
  const _MemberIDDetails({
    required this.canShop,
    required this.qrCode,
  });

  final bool canShop;
  final String? qrCode;

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
                      data: qrCode ?? "-",
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
    required this.canShop,
  });

  final bool canShop;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    String canShopDetails;

    if (canShop) {
      icon = const Icon(
        Icons.check_circle,
        color: AppColors.lightGreen,
      );
      canShopDetails = S.of(context).allowedToShopAsMember;
    } else {
      icon = const Icon(
        Icons.report_problem,
        color: AppColors.orange,
      );
      canShopDetails = S.of(context).notAllowedToShop;
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
