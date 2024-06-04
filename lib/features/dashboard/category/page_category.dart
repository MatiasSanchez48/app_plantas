import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/extensions/theme_default.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// TODO: Add description.
@RoutePage()
class PageCategory extends StatefulWidget {
  const PageCategory({super.key});

  @override
  State<PageCategory> createState() => _PageCategoryState();
}

class _PageCategoryState extends State<PageCategory> {
  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [
              const Logo(radius: 20),
              const SizedBox(width: 10),
              if (_isSearching)
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Buscar...', // TODO: translate.
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: colors.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                Text(
                  'PLANTS', // TODO: translate.
                  style: TextStyle(
                    color: colors.onBackground,
                    letterSpacing: 1.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
            ],
          ),
          backgroundColor: colors.background,
          flexibleSpace: const FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: PlantsImage(
                image: AssetImage(
                  'assets/images/jardin_fondo.png',
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(_isSearching ? Icons.close : Icons.search),
              onPressed: () => setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              }),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                /// TODO: navigate to configuration.
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SelectableText(
                        'CATEGORIAS', // TODO: translate.
                        style: TextStyle(
                          color: colors.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _IconWithCategory(
                          imageAsset: 'trophy', // TODO: translate.
                          title: 'RANK', // TODO: translate.
                          colorBackground: colors.yellowPlants,
                        ),
                        _IconWithCategory(
                          imageAsset: 'fire', // TODO: translate.
                          title: 'HOT', // TODO: translate.
                          colorBackground: colors.redPlants,
                        ),
                        _IconWithCategory(
                          imageAsset: 'heart', // TODO: translate.
                          title: 'LOVED', // TODO: translate.
                          colorBackground: colors.purplePlants,
                        ),
                        _IconWithCategory(
                          imageAsset: 'school', // TODO: translate.
                          title: 'SECRETS', // TODO: translate.
                          colorBackground: colors.greenPlants,
                        ),
                      ],
                    ),
                  ],
                )
                //  ListView.builder(
                //   itemCount: 4,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) => Container(
                //     height: 100,
                //     width: 80,
                //     child: Column(
                //       children: [
                //         Center(
                //           child: Icon(
                //             Icons.currency_pound,
                //             color: colors.primary,
                //             size: 50,
                //           ),
                //         ),
                //         Text(
                //           'RANK', // TODO: translate.
                //           style: TextStyle(
                //             color: colors.primary,
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ),
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

/// TODO: Add description.
class _IconWithCategory extends StatelessWidget {
  const _IconWithCategory({
    required this.title,
    required this.imageAsset,
    required this.colorBackground,
  });

  /// TODO: Add description.
  final String title;

  /// TODO: Add description.
  final String imageAsset;

  /// TODO: Add description.
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: () {
        /// TODO: navigate to category.
      },
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: colorBackground.withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/$imageAsset.png',
                ),
              ),
            ),
            const SizedBox(height: 5),
            SelectableText(
              title,
              style: TextStyle(
                color: colors.onBackground,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
