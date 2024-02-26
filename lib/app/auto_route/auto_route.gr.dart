// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_plantas/pages/auth/forgot_password/page_forgot_password.dart'
    as _i3;
import 'package:app_plantas/pages/auth/login/page_login.dart' as _i5;
import 'package:app_plantas/pages/auth/register/page_register.dart' as _i6;
import 'package:app_plantas/pages/dashboard/home/page_home.dart' as _i4;
import 'package:app_plantas/pages/dashboard/page_dashboard.dart' as _i2;
import 'package:app_plantas/pages/dashboard/settings/page_settings.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i7;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    RouteConfiguration.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PageConfiguration(),
      );
    },
    RouteDashBoard.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PageDashBoard(),
      );
    },
    RouteForgotPassword.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageForgotPassword(),
      );
    },
    RouteHome.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PageHome(),
      );
    },
    RouteLogin.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PageLogin(),
      );
    },
    RouteRegister.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PageRegister(),
      );
    },
  };
}

/// generated route for
/// [_i1.PageConfiguration]
class RouteConfiguration extends _i7.PageRouteInfo<void> {
  const RouteConfiguration({List<_i7.PageRouteInfo>? children})
      : super(
          RouteConfiguration.name,
          initialChildren: children,
        );

  static const String name = 'RouteConfiguration';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PageDashBoard]
class RouteDashBoard extends _i7.PageRouteInfo<void> {
  const RouteDashBoard({List<_i7.PageRouteInfo>? children})
      : super(
          RouteDashBoard.name,
          initialChildren: children,
        );

  static const String name = 'RouteDashBoard';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PageForgotPassword]
class RouteForgotPassword extends _i7.PageRouteInfo<void> {
  const RouteForgotPassword({List<_i7.PageRouteInfo>? children})
      : super(
          RouteForgotPassword.name,
          initialChildren: children,
        );

  static const String name = 'RouteForgotPassword';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PageHome]
class RouteHome extends _i7.PageRouteInfo<void> {
  const RouteHome({List<_i7.PageRouteInfo>? children})
      : super(
          RouteHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteHome';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PageLogin]
class RouteLogin extends _i7.PageRouteInfo<void> {
  const RouteLogin({List<_i7.PageRouteInfo>? children})
      : super(
          RouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteLogin';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PageRegister]
class RouteRegister extends _i7.PageRouteInfo<void> {
  const RouteRegister({List<_i7.PageRouteInfo>? children})
      : super(
          RouteRegister.name,
          initialChildren: children,
        );

  static const String name = 'RouteRegister';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
