import 'package:app_plantas/app/auto_route/auto_route.dart';
import 'package:app_plantas/app/auto_route/auto_route_observer.dart';
import 'package:app_plantas/app/view/bloc/bloc_theme.dart';
import 'package:app_plantas/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template App}
/// TODO: Add description.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro App}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocTheme>(
      create: (context) => BlocTheme(),
      child: BlocBuilder<BlocTheme, BlocThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.theme,
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (context, child) => ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: child!,
            ),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [RouterObserver()],
            ),
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
            ],
          );
        },
      ),
    );
  }
}

/// {@template NoGlowBehavior}
/// TODO: Add description.
/// {@endtemplate}
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}
