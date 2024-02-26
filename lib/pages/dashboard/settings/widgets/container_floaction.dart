import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// {@template ContainerFloacting}
/// TODO: Add description.
/// {@endtemplate}
class ContainerFloacting extends StatelessWidget {
  /// {@macro ContainerFloacting}
  const ContainerFloacting({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                Icons.bookmark_border_rounded,
                color: colors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Books', // TODO: l10n.
                style: TextStyle(
                  color: colors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // TODO: add function.
                },
                child: Row(
                  children: [
                    Text(
                      '2 books unlocked', // TODO: l10n.
                      style: TextStyle(
                        color: colors.greyNotImage,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: colors.greyNotImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
