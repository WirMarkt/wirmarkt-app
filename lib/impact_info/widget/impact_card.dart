import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

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
  Widget build(BuildContext context) {
    var padding = 32.0;
    return Card(
      semanticContainer: true,
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
            top: padding / 2,
            left: padding,
            right: padding,
            bottom: 64,
            child: IconPlaceholderImage.network(imageUrl, fit: BoxFit.contain),
          ),
          Positioned(
              bottom: padding,
              height: padding,
              left: padding,
              right: padding,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
                ),
              )),
          if (explanation != null)
            Positioned(
              height: padding,
              bottom: 0,
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
    );
  }
}
