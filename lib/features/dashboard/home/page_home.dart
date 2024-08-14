import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:app_plantas/features/dashboard/home/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageHome}
/// TODO: Add description.
/// {@endtemplate}
class PageHome extends StatefulWidget {
  /// {@macro PageHome}
  const PageHome({
    super.key,
  });

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _dialogSuccess(BuildContext context) {
    final colors = context.colors;

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Plant created successfully', // TODO(anyone): l10n
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colors.onBackground,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: PlantsBotton(
                  text: 'Continue', // TODO(anyone): l10n
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocConsumer<BlocHome, BlocHomeState>(
      listener: (context, state) {
        if (state is BlocHomeStateCreatingPlant) {
          const DialogPlantsLoading().show(
            context,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Creating plant...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is BlocHomeStateSuccessToCreatePlant) {
          Navigator.of(context).pop();
          _dialogSuccess(context);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
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
                    tag: 'jardin_fondo',
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
                  onPressed: () =>
                      AutoTabsRouter.of(context)..setActiveIndex(3),
                ),
              ],
            ),
            if (state is BlocHomeStateLoading)
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              )
            else if (state.plants.isEmpty)
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'No plants found...', // TODO: translate
                      style: TextStyle(
                        color: colors.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            else if (state.plants.isNotEmpty)
              ListOfPublics(
                title: 'Plants', // TODO: translate
                plants: state.plants,
              ),
          ],
        );
      },
    );
  }
}
