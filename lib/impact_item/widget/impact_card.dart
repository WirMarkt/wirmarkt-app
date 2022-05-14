import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

class ImpactCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? explanation;
  final Color? backgroundColor;

  final BoxFit? fit;

  const ImpactCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.explanation,
    this.fit,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var padding = 32.0;
    return AspectRatio(
      aspectRatio: 1.4,
      child: Card(
        semanticContainer: true,
        child: Container(
          color: backgroundColor,
          child: Stack(
            children: [
              Positioned(
                top: padding / 2,
                left: padding,
                right: padding,
                bottom: padding * 3,
                child:
                    IconPlaceholderImage.network(imageUrl, fit: BoxFit.contain),
              ),
              Positioned(
                  bottom: padding * 2,
                  height: padding,
                  left: padding,
                  right: padding,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )),
              if (explanation != null)
                Positioned(
                  height: padding,
                  bottom: padding,
                  left: padding,
                  right: padding,
                  child: Center(
                    child: Text(
                      explanation!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
