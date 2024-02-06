// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_plantas/pages/dashboard/home/page_home.dart' as _i3;
import 'package:app_plantas/pages/dashboard/page_dashboard.dart' as _i2;
import 'package:app_plantas/pages/dashboard/settings/page_settings.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i4;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RouteConfiguration.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PageConfiguration(),
      );
    },
    RouteDashBoard.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PageDashBoard(),
      );
    },
    RouteHome.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageHome(),
      );
    },
  };
}

/// generated route for
/// [_i1.PageConfiguration]
class RouteConfiguration extends _i4.PageRouteInfo<void> {
  const RouteConfiguration({List<_i4.PageRouteInfo>? children})
      : super(
          RouteConfiguration.name,
          initialChildren: children,
        );

  static const String name = 'RouteConfiguration';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PageDashBoard]
class RouteDashBoard extends _i4.PageRouteInfo<void> {
  const RouteDashBoard({List<_i4.PageRouteInfo>? children})
      : super(
          RouteDashBoard.name,
          initialChildren: children,
        );

  static const String name = 'RouteDashBoard';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PageHome]
class RouteHome extends _i4.PageRouteInfo<void> {
  const RouteHome({List<_i4.PageRouteInfo>? children})
      : super(
          RouteHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteHome';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
