import 'package:flutter/material.dart';
import 'package:wir_markt/wm_design.dart';

//TODO quite identical to ImpactCard
class RecipeCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String? explanation;
  final Color? textColor;
  final Color? backgroundColor;

  final BoxFit? fit;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.image,
    this.explanation,
    this.fit,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, boxConstraints) {
        var height = boxConstraints.maxWidth * 0.7;
        var padding = 32.0;
        return Card(
          elevation: WMDesign.defaultElevation,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Container(
                height: height,
                color: backgroundColor,
              ),
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  image: DecorationImage(
                    fit: fit ?? BoxFit.fitWidth,
                    image: image,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height * 0.6,
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    height: height * 0.4,
                    color: backgroundColor ?? WMDesign.darkGrey,
                  ),
                ),
              ),
              Positioned(
                  top: height * 0.65,
                  left: padding,
                  right: padding,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: textColor ?? WMDesign.white, fontSize: 24),
                    ),
                  )),
              if (explanation != null)
                Positioned(
                  top: height * 0.8,
                  left: padding,
                  right: padding,
                  child: Text(
                    explanation!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: textColor ?? WMDesign.white, fontSize: 14),
                  ),
                ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        );
      });
}
