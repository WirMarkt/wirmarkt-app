import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final ImageProvider image;

  /// callback when button is tapped
  final GestureTapCallback? onTap;

  final String title;

  final Color? color;

  const MenuButton(
      {super.key,
      required this.image,
      this.onTap,
      this.color,
      required this.title});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var cardColor = color ??
        themeData.buttonTheme.colorScheme?.surface ??
        themeData.cardColor;
    var colorFilter = ColorFilter.matrix(<double>[
      cardColor.red / 255.0, 0.5, 0.5, 0, 0, //
      0.5, cardColor.green / 255.0, 0.5, 0, 0, //
      0.5, 0.5, cardColor.blue / 255.0, 0, 0, //
      0, 0, 0, 1, 0,
    ]);
    return AspectRatio(
      aspectRatio: 1.05,
      child: Card(
        semanticContainer: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  cardColor.withAlpha(50),
                  cardColor.withAlpha(80),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Positioned(
                  top: 64,
                  left: 16,
                  bottom: 16,
                  right: 16,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ColorFiltered(
                      colorFilter: colorFilter,
                      child: Image(
                        image: image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  right: 16,
                  child: Text(
                    title,
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
