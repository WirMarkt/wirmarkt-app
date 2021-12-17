import 'package:flutter/material.dart';

class ImpactCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String? explanation;

  final BoxFit? fit;

  const ImpactCard(
      {Key? key, required this.title, required this.image, this.explanation, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, boxConstraints) {
        var height = boxConstraints.maxWidth * 0.7;
        var padding = 32.0;
        return Card(
          elevation: 4,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              SizedBox(
                height: height,
              ),
              Container(
                height: height * 0.6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: fit ?? BoxFit.cover,
                    image: image,
                  ),
                ),
              ),
              Positioned(
                  top: height * 0.65,
                  left: padding,
                  right: padding,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: 24),
                  )),
              if (explanation != null)
                Positioned(
                  top: height * 0.8,
                  left: padding,
                  right: padding,
                  child: Text(
                    explanation!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14),
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
