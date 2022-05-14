import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

class PartnerCard extends StatelessWidget {
  final String imageUrl;
  final List<String> photoUrlList;
  final String title;
  final String? explanation;

  const PartnerCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.photoUrlList = const [],
    this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Card(
                child: IconPlaceholderImage.network(
              imageUrl,
              aspectRatio: 2.3,
            )),
          ),
          SizedBox(height: 12.0),
          Wrap(
            spacing: 12,
            children: photoUrlList
                .take(4)
                .map((e) => _PartnerPhoto(photoUrl: e))
                .toList(),
          ),
          SizedBox(height: 16.0),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16.0),
          if (explanation != null)
            Text(
              explanation!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          Spacer(),
        ],
      ),
    );
  }
}

class _PartnerPhoto extends StatelessWidget {
  final String photoUrl;

  const _PartnerPhoto({
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: IconPlaceholderImage.network(photoUrl, fit: BoxFit.contain)),
    );
  }
}
