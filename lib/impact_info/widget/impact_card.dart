import 'package:flutter/material.dart';
import 'package:wir_markt/widgets/icon_placeholder_image.dart';

class ImpactCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? explanation;
  final Color? backgroundColor;

  final BoxFit? fit;

  const ImpactCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.explanation,
    this.fit,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, boxConstraints) {
        var height = boxConstraints.maxWidth * 0.7;
        var padding = 32.0;
        return Card(
          semanticContainer: true,
          child: Stack(
            children: [
              Container(
                height: height,
                color: backgroundColor,
              ),
              Positioned(
                top: padding / 2,
                left: padding,
                right: padding,
                height: height * 0.65 - padding,
                child:
                    IconPlaceholderImage.network(imageUrl, fit: BoxFit.contain),
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
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(),
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ),
            ],
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        );
      });
}
