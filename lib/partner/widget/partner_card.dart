import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

class PartnerCard extends StatelessWidget {
  final String imageUrl;
  final List<String> photoUrlList;
  final String title;
  final String? explanation;
  final Color? backgroundColor;

  final BoxFit? fit;

  const PartnerCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.photoUrlList = const [],
    this.explanation,
    this.fit,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2.5,
            child: Card(
                child: IconPlaceholderImage.network(imageUrl,
                    fit: BoxFit.fitWidth)),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...photoUrlList.take(5).map((e) => Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: IconPlaceholderImage.network(e,
                              fit: BoxFit.contain)),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
          ),
          SizedBox(height: 16.0),
          if (explanation != null)
            Text(
              explanation!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
            ),
          Spacer()
        ],
      ),
    );
  }
}
