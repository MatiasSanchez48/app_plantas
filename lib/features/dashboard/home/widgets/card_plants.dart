import 'package:app_plantas/extensions/colors.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CardPlants extends StatelessWidget {
  const CardPlants({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.background,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.network(
                          'data:image/jpeg;base64,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',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            decoration: BoxDecoration(
                              color: colors.greyNotImage,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Planta',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colors.black,
                            ),
                          ),
                          Text(
                            'descripcion',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: colors.greyNotImage,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.sunny,
                                color: colors.yellow,
                                size: 14,
                              ),
                              Text(
                                'Luz parcial',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: colors.greySubTitle,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.water_drop_sharp,
                                color: colors.blue,
                                size: 14,
                              ),
                              Text(
                                'Luz parcial',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: colors.greySubTitle,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: colors.greySubTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Regar en 1 dias',
                    style: TextStyle(
                      color: colors.greySubTitle,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.note_add_sharp,
                        color: colors.greySubTitle,
                        size: 12,
                      ),
                      Text(
                        'Diario',
                        style: TextStyle(
                          color: colors.greySubTitle,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
