import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

///TODO add description
class PlantsImage extends StatelessWidget {
  const PlantsImage({
    required this.image,
    required this.tag,
    this.height,
    this.width,
    super.key,
  });

  /// add description
  final ImageProvider<Object> image;

  final String tag;

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Hero(
      tag: tag,
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Container(
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
      ),
    );
  }
}
