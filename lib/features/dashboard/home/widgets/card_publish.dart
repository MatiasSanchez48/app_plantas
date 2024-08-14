import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/widgets/widgets.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class CardPublish extends StatelessWidget {
  const CardPublish({
    required this.plant,
    super.key,
  });

  /// TODO: Add description.
  final Plant plant;

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
        child: Stack(
          children: [
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(plant: plant),
                  InkWell(
                    onTap: () => openImage(
                      context,
                      tag: plant.name ?? '',
                      image: Image.memory(
                        (plant.imagenesUint8List ?? []).first,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            InitialsNames(
                          nameComplete: plant.autor?.username ?? '',
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                      child: SizedBox(
                        child: (plant.imagenesUint8List ?? []).isEmpty
                            ? const SizedBox()
                            : Center(
                                child: PlantsImage(
                                  tag: plant.name ?? '',
                                  image: MemoryImage(
                                    (plant.imagenesUint8List ?? []).first,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if ((plant.imagenesUint8List ?? []).length > 1)
              Positioned(
                right: 0,
                bottom: 50,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(50),
                    top: Radius.circular(50),
                  ),
                  child: ColoredBox(
                    color: colors.onBackground.withOpacity(.5),
                    child: IconButton(
                      onPressed: () => openImages(
                        context,
                        tag: plant.name ?? '',
                        images: plant.imagenesUint8List ?? [],
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: colors.background,
                              size: 17,
                            ),
                            Text(
                              ((plant.imagenesUint8List ?? []).length - 1)
                                  .toString(),
                              style: TextStyle(
                                color: colors.background,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
