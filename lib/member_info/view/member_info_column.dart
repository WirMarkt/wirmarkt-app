import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_info/model/member_info.dart';
import 'package:wir_markt/widgets/orientation_based_flex.dart';
import 'package:wir_markt/wm_design.dart';

class MemberInfoColumn extends StatelessWidget {
  final MemberInfo memberInfo;

  const MemberInfoColumn({
    Key? key,
    required this.memberInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon icon;
    String canShopDetails;

    if (memberInfo.canShop == true) {
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
    return Center(
      child: OrientationBasedFlex(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    child: icon,
                  ),
                ),
                Text(canShopDetails,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
                const Padding(
                  padding: EdgeInsets.all(24),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    color: memberInfo.canShop == true
                        ? Colors.white
                        : Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: FittedBox(
                        child: CustomPaint(
                          size: const Size(1000, 1000),
                          painter: QrPainter(
                            data: memberInfo.idQrCode,
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
          ),
        ],
      ),
    );
  }
}
