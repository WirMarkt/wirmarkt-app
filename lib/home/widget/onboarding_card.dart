import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wir_markt/wm_design.dart';

class OnboardingCard extends StatefulWidget {
  final ImageProvider iconImage;

  /// show check icon on top right corner
  /// indicates that onboarding task is completed
  final bool done;

  /// callback when card is tapped
  final GestureTapCallback? onTap;

  /// further explanation
  final String? explanation;

  /// title of onboarding task
  final String title;

  const OnboardingCard(
      {Key? key,
      required this.iconImage,
      this.done = false,
      this.onTap,
      this.explanation,
      required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OnboardingCardState();
  }
}

class OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        const minHeight = 100.0;
        var height = max(constraints.maxWidth * 0.2, minHeight);
        var paddingUnit = height / 16;
        var borderRadius = BorderRadius.all(Radius.circular(paddingUnit));
        var iconSize = height - paddingUnit * 4;
        var fontSize = paddingUnit * 3;
        var cardOffset = height / 2;
        return Padding(
          padding: EdgeInsets.only(
            top: paddingUnit * 4,
            bottom: 0,
            right: paddingUnit * 3,
            left: paddingUnit * 3,
          ),
          child: InkResponse(
            onTap: widget.onTap,
            child: SizedBox(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //card background
                  Positioned(
                      left: cardOffset,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Card(
                        elevation: WMDesign.defaultElevation,
                        margin: EdgeInsets.zero,
                        shape:
                            RoundedRectangleBorder(borderRadius: borderRadius),
                      )),
                  //icon
                  Positioned(
                    left: cardOffset - iconSize / 2,
                    top: height / 2 - iconSize / 2,
                    width: iconSize,
                    height: iconSize,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: widget.iconImage,
                      ),
                    ),
                  ),
                  //title text
                  Positioned(
                    left: cardOffset + iconSize / 2 + paddingUnit * 2,
                    top: height / 2 -
                        fontSize / 2 * (widget.explanation != null ? 3 : 1),
                    right: paddingUnit * 2,
                    height: fontSize,
                    child: FittedBox(
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  if (widget.explanation != null)
                    //explanation text
                    Positioned(
                      left: cardOffset + iconSize / 2 + paddingUnit * 2,
                      top: height / 2 - fontSize / 2 * 0.8,
                      right: paddingUnit * 2,
                      height: fontSize * 0.8,
                      child: Text(
                        widget.explanation!,
                        overflow: TextOverflow.visible,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: fontSize * 0.6),
                      ),
                    ),
                  if (widget.done)
                    //done icon on top right corner
                    Positioned(
                      right: paddingUnit,
                      top: paddingUnit,
                      child: Icon(
                        Icons.check,
                        size: paddingUnit * 2,
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      });
}
