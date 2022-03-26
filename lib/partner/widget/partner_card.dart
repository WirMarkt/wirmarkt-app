import 'package:flutter/material.dart';

import '../../widgets/icon_placeholder_image.dart';

class PartnerCard extends StatelessWidget {
  final String imageUrl;
  final List<String> photoUrlList;
  final String title;
  final String? explanation;

  const PartnerCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.photoUrlList = const [],
    this.explanation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            width: 350,
            child: Card(
                child: IconPlaceholderImage.network(imageUrl,
                    fit: BoxFit.fitWidth)),
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
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 78,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: IconPlaceholderImage.network(photoUrl, fit: BoxFit.contain)),
    );
  }
}
