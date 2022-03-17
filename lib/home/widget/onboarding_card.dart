import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final ImageProvider image;

  /// callback when card is tapped
  final GestureTapCallback? onTap;

  /// title of onboarding task
  final String title;

  final Color? color;

  const OnboardingCard(
      {Key? key,
      required this.image,
      this.onTap,
      this.color,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardColor = color ?? Theme.of(context).colorScheme.secondaryContainer;
    var colorFilter = ColorFilter.matrix(<double>[
      cardColor.red / 255.0, 1, 0.0722, 0, 0, //
      cardColor.green / 255.0, 1, 0.0722, 0, 0, //
      cardColor.blue / 255.0, 1, 0.0722, 0, 0, //
      0, 0, 0, 1, 0,
    ]);
    return Card(
      color: cardColor,
      semanticContainer: true,
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
