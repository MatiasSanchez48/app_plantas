import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:app_plantas/features/dashboard/home/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageHome}
/// TODO: Add description.
/// {@endtemplate}
class PageHome extends StatefulWidget {
  /// {@macro PageHome}
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            automaticallyImplyLeading: false,
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
          ListOfPublics(
            title: 'Feature not implemented yet!',
            modelPublics: [
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
            ],
          ),
          ListOfPublics(
            title: 'ads ads ads',
            modelPublics: [
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
            ],
          ),
          ListOfPublics(
            title: 'Popular products',
            modelPublics: [
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
              ModelPublics(
                id: 1,
                imageUrl:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
                personPublic: 'Person',
                namePublic: 'Name',
                datePublic: DateTime.now(),
                imageProfile:
                    'https://images.wondershare.com/mockitt/ui-design/ui-example-round-corners-trend.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Model of example
class ModelPublics {
  ModelPublics({
    required this.imageProfile,
    required this.id,
    required this.personPublic,
    required this.datePublic,
    required this.namePublic,
    required this.imageUrl,
  });

  final String personPublic;
  final String namePublic;
  final DateTime datePublic;
  final String imageProfile;
  final String imageUrl;
  final int id;
}
