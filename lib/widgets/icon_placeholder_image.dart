import 'package:flutter/material.dart';

@immutable
class IconPlaceholderImage extends StatelessWidget {
  final String url;
  final double aspectRatio;
  final IconData icon;
  final BoxFit? fit;

  const IconPlaceholderImage(
      {Key? key,
      required this.url,
      required this.icon,
      this.aspectRatio = 1.0,
      this.fit = BoxFit.fitWidth})
      : super(key: key);

  factory IconPlaceholderImage.network(String src,
      {double aspectRatio = 1.0, IconData icon = Icons.image, BoxFit? fit}) {
    return IconPlaceholderImage(
        url: src, aspectRatio: aspectRatio, icon: icon, fit: fit);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.network(
        url,
        isAntiAlias: true,
        fit: fit ?? BoxFit.fitWidth,
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool wasSynchronouslyLoaded) {
          if (frame != null) {
            return child;
          }
          return FittedBox(
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.fitWidth,
        placeholder: (_, __) => Icon(icon),
      ),
    );
  }
   */
}
