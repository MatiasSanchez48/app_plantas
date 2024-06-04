// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_plantas/features/auth/forgot_password/page_forgot_password.dart'
    as _i4;
import 'package:app_plantas/features/auth/login/page_login.dart' as _i6;
import 'package:app_plantas/features/auth/register/page_register.dart' as _i8;
import 'package:app_plantas/features/dashboard/category/page_category.dart'
    as _i1;
import 'package:app_plantas/features/dashboard/home/page_home.dart' as _i5;
import 'package:app_plantas/features/dashboard/page_dashboard.dart' as _i3;
import 'package:app_plantas/features/dashboard/profile/page_profile.dart'
    as _i7;
import 'package:app_plantas/features/dashboard/settings/page_settings.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i9;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    RouteCategory.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PageCategory(),
      );
    },
    RouteConfiguration.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PageConfiguration(),
      );
    },
    RouteDashBoard.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageDashBoard(),
      );
    },
    RouteForgotPassword.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PageForgotPassword(),
      );
    },
    RouteHome.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PageHome(),
      );
    },
    RouteLogin.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PageLogin(),
      );
    },
    RouteProfile.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PageProfile(),
      );
    },
    RouteRegister.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PageRegister(),
      );
    },
  };
}

/// generated route for
/// [_i1.PageCategory]
class RouteCategory extends _i9.PageRouteInfo<void> {
  const RouteCategory({List<_i9.PageRouteInfo>? children})
      : super(
          RouteCategory.name,
          initialChildren: children,
        );

  static const String name = 'RouteCategory';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PageConfiguration]
class RouteConfiguration extends _i9.PageRouteInfo<void> {
  const RouteConfiguration({List<_i9.PageRouteInfo>? children})
      : super(
          RouteConfiguration.name,
          initialChildren: children,
        );

  static const String name = 'RouteConfiguration';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PageDashBoard]
class RouteDashBoard extends _i9.PageRouteInfo<void> {
  const RouteDashBoard({List<_i9.PageRouteInfo>? children})
      : super(
          RouteDashBoard.name,
          initialChildren: children,
        );

  static const String name = 'RouteDashBoard';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PageForgotPassword]
class RouteForgotPassword extends _i9.PageRouteInfo<void> {
  const RouteForgotPassword({List<_i9.PageRouteInfo>? children})
      : super(
          RouteForgotPassword.name,
          initialChildren: children,
        );

  static const String name = 'RouteForgotPassword';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PageHome]
class RouteHome extends _i9.PageRouteInfo<void> {
  const RouteHome({List<_i9.PageRouteInfo>? children})
      : super(
          RouteHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteHome';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PageLogin]
class RouteLogin extends _i9.PageRouteInfo<void> {
  const RouteLogin({List<_i9.PageRouteInfo>? children})
      : super(
          RouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteLogin';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PageProfile]
class RouteProfile extends _i9.PageRouteInfo<void> {
  const RouteProfile({List<_i9.PageRouteInfo>? children})
      : super(
          RouteProfile.name,
          initialChildren: children,
        );

  static const String name = 'RouteProfile';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PageRegister]
class RouteRegister extends _i9.PageRouteInfo<void> {
  const RouteRegister({List<_i9.PageRouteInfo>? children})
      : super(
          RouteRegister.name,
          initialChildren: children,
        );

  static const String name = 'RouteRegister';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
