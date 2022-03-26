import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? explanation;

  final GestureTapCallback? onTap;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.explanation,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: edgeInsets,
            child: IconPlaceholderImage.network(
              imageUrl,
              aspectRatio: 1.5,
            ),
          ),
          Padding(
            padding: edgeInsets,
            child: Text(
              title,
              textAlign: TextAlign.left,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          if (explanation != null)
            Padding(
              padding: edgeInsets,
              child: Text(
                explanation!,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
