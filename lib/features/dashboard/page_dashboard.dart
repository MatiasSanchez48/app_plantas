import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
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
  const PageDashBoard({super.key});
  String _titleAppbar(BuildContext context) {
    return switch (context.topRoute.name) {
      RouteConfiguration.name => 'Configuration', // TODO: l10n.
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocHome()..add(const BlocHomeEventInitial()),
        ),
      ],
      child: AutoTabsRouter.tabBar(
        physics: const NeverScrollableScrollPhysics(),
        routes: const [
          RouteHome(),
          RouteConfiguration(),
        ],
        builder: (context, child, controller) {
          final tabsRouter = AutoTabsRouter.of(context);

          return CustomScaffold(
            body: child,
            backgroundColor: colors.greyNotImage,
            titleAppBar: _titleAppbar(context),
            withAppbar: tabsRouter.activeIndex == 1,
            bottomNavigationBar: _CustomBottomNavigationBottomBar(
              onIndexChanged: tabsRouter.setActiveIndex,
              indexActual: tabsRouter.activeIndex,
            ),
          );
        },
      ),
    );
  }
}

/// {@template _CustomBottomNavigationBar}
/// TODO: Add description.
/// {@endtemplate}
class _CustomBottomNavigationBottomBar extends StatefulWidget {
  /// {@macro _CustomBottomNavigationBar}
  const _CustomBottomNavigationBottomBar({
    required this.onIndexChanged,
    required this.indexActual,
  });

  /// TODO: Add description.
  final void Function(int index, {bool notify}) onIndexChanged;

  /// TODO: Add description.
  final int indexActual;

  @override
  _CustomBottomNavigationBottomBarState createState() =>
      _CustomBottomNavigationBottomBarState();
}

class _CustomBottomNavigationBottomBarState
    extends State<_CustomBottomNavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.primaryOpacity30),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: colors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.home_rounded,
              color:
                  0 == widget.indexActual ? colors.primary : colors.onSecondary,
            ),
            onPressed: () => widget.onIndexChanged(0),
          ),
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.menu_rounded,
              color:
                  1 == widget.indexActual ? colors.primary : colors.onSecondary,
            ),
            onPressed: () => widget.onIndexChanged(1),
          ),
        ],
      ),
    );
  }
}
