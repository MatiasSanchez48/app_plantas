import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/page_home.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class CardPublish extends StatelessWidget {
  const CardPublish({
    required this.modelPublics,
    super.key,
  });

  /// TODO: Add description.
  final ModelPublics modelPublics;

  /// TODO: Add description.
  void _openImage(
    BuildContext context,
    String imageUrl,
    String namePublic,
  ) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => InitialsNames(
                  nameComplete: namePublic,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15),
          ),
          color: colors.background,
        ),
        height: 200,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        modelPublics.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            InitialsNames(
                          nameComplete: modelPublics.namePublic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 180,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectableText(
                          modelPublics.namePublic,
                          style: TextStyle(
                            color: colors.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),
                        SelectableText(
                          modelPublics.datePublic.formattedDate,
                          style: TextStyle(
                            color: colors.onSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _openImage(
                  context,
                  modelPublics.imageUrl,
                  modelPublics.namePublic,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: modelPublics.imageUrl,
                    child: PlantsImage(
                      image: NetworkImage(
                        modelPublics.imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
