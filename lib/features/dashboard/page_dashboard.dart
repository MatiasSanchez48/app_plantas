import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageDashBoard}
/// TODO: Add description.
/// {@endtemplate}
class PageDashBoard extends StatelessWidget {
  /// {@macro PageDashBoard}
  const PageDashBoard({
    this.usuario,
    super.key,
  });
  final User? usuario;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        RouteHome(),
        RouteCategory(),
        RouteChats(),
        RouteConfiguration(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return BlocProvider<BlocHome>(
          create: (context) =>
              BlocHome(usuario: usuario)..add(const BlocHomeEventInitial()),
          child: CustomScaffold(
            body: child,
            backgroundColor: colors.greyNotImage,
            titleAppBar: context.routeData.name.nameRoute(context),
            withAppbar: tabsRouter.activeIndex == 3,
            floatingActionButton: const CustomFloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: _CustomBottomNavigationBottomBar(
              onIndexChanged: tabsRouter.setActiveIndex,
              indexActual: tabsRouter.activeIndex,
            ),
          ),
        );
      },
    );
  }
}

/// {@template _CustomBottomNavigationBar}
/// TODO: Add description.
/// {@endtemplate}
class _CustomBottomNavigationBottomBar extends StatelessWidget {
  /// {@macro _CustomBottomNavigationBar}
  const _CustomBottomNavigationBottomBar({
    required this.onIndexChanged,
    required this.indexActual,
  });

  /// TODO: Add description.
  final void Function(int index, {bool notify}) onIndexChanged;

  /// TODO: Add description.
  final int indexActual;

  Color _indexActually(int number, BuildContext context) {
    final colors = context.colors;

    return number == indexActual ? colors.primary : colors.onSecondary;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.primaryOpacity30),
        ),
        color: colors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.home_rounded,
              color: _indexActually(0, context),
            ),
            onPressed: () => onIndexChanged(0),
          ),
          const Spacer(),
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.grid_view_rounded,
              color: _indexActually(1, context),
            ),
            onPressed: () => onIndexChanged(1),
          ),
          const Spacer(flex: 2),
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.person_rounded,
              color: _indexActually(2, context),
            ),
            onPressed: () => onIndexChanged(2),
          ),
          const Spacer(),
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.settings_rounded,
              color: _indexActually(3, context),
            ),
            onPressed: () => onIndexChanged(3),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
