import 'dart:typed_data';

import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

// TODO: Add description
void openImage(
  BuildContext context, {
  required String tag,
  required Image image,
}) =>
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Hero(
        tag: tag,
        child: Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: image,
          ),
        ),
      ),
    );

void openImages(
  BuildContext context, {
  required String tag,
  required List<Uint8List> images,
}) =>
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final colors = context.colors;

        return Hero(
          tag: tag,
          child: Dialog(
            backgroundColor: colors.background,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(26),
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) => Image.memory(
                      images[index],
                      fit: BoxFit.contain,
                      width: 250,
                      errorBuilder: (context, error, stackTrace) =>
                          InitialsNames(
                        nameComplete: tag,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
