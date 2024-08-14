// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_plantas/features/auth/forgot_password/page_forgot_password.dart'
    as _i6;
import 'package:app_plantas/features/auth/login/page_login.dart' as _i8;
import 'package:app_plantas/features/auth/register/page_register.dart' as _i9;
import 'package:app_plantas/features/dashboard/category/page_category.dart'
    as _i1;
import 'package:app_plantas/features/dashboard/chats/chat/page_chat.dart'
    as _i2;
import 'package:app_plantas/features/dashboard/chats/page_chats.dart' as _i3;
import 'package:app_plantas/features/dashboard/chats/users/page_users.dart'
    as _i10;
import 'package:app_plantas/features/dashboard/home/page_home.dart' as _i7;
import 'package:app_plantas/features/dashboard/page_dashboard.dart' as _i5;
import 'package:app_plantas/features/dashboard/settings/page_settings.dart'
    as _i4;
import 'package:app_plantas/models/models.dart' as _i13;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    RouteCategory.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PageCategory(),
      );
    },
    RouteChat.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteChatArgs>(
          orElse: () => RouteChatArgs(idUser: pathParams.getString('id')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PageChat(
          idUser: args.idUser,
          key: args.key,
        ),
      );
    },
    RouteChats.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageChats(),
      );
    },
    RouteConfiguration.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PageConfiguration(),
      );
    },
    RouteDashBoard.name: (routeData) {
      final args = routeData.argsAs<RouteDashBoardArgs>(
          orElse: () => const RouteDashBoardArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PageDashBoard(
          usuario: args.usuario,
          key: args.key,
        ),
      );
    },
    RouteForgotPassword.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteForgotPasswordArgs>(
          orElse: () =>
              RouteForgotPasswordArgs(token: pathParams.getString('token')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.PageForgotPassword(
          token: args.token,
          key: args.key,
        ),
      );
    },
    RouteHome.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PageHome(),
      );
    },
    RouteLogin.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PageLogin(),
      );
    },
    RouteRegister.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PageRegister(),
      );
    },
    RouteUsers.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PageUsers(),
      );
    },
  };
}

/// generated route for
/// [_i1.PageCategory]
class RouteCategory extends _i11.PageRouteInfo<void> {
  const RouteCategory({List<_i11.PageRouteInfo>? children})
      : super(
          RouteCategory.name,
          initialChildren: children,
        );

  static const String name = 'RouteCategory';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PageChat]
class RouteChat extends _i11.PageRouteInfo<RouteChatArgs> {
  RouteChat({
    required String idUser,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RouteChat.name,
          args: RouteChatArgs(
            idUser: idUser,
            key: key,
          ),
          rawPathParams: {'id': idUser},
          initialChildren: children,
        );

  static const String name = 'RouteChat';

  static const _i11.PageInfo<RouteChatArgs> page =
      _i11.PageInfo<RouteChatArgs>(name);
}

class RouteChatArgs {
  const RouteChatArgs({
    required this.idUser,
    this.key,
  });

  final String idUser;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RouteChatArgs{idUser: $idUser, key: $key}';
  }
}

/// generated route for
/// [_i3.PageChats]
class RouteChats extends _i11.PageRouteInfo<void> {
  const RouteChats({List<_i11.PageRouteInfo>? children})
      : super(
          RouteChats.name,
          initialChildren: children,
        );

  static const String name = 'RouteChats';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PageConfiguration]
class RouteConfiguration extends _i11.PageRouteInfo<void> {
  const RouteConfiguration({List<_i11.PageRouteInfo>? children})
      : super(
          RouteConfiguration.name,
          initialChildren: children,
        );

  static const String name = 'RouteConfiguration';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PageDashBoard]
class RouteDashBoard extends _i11.PageRouteInfo<RouteDashBoardArgs> {
  RouteDashBoard({
    _i13.User? usuario,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RouteDashBoard.name,
          args: RouteDashBoardArgs(
            usuario: usuario,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteDashBoard';

  static const _i11.PageInfo<RouteDashBoardArgs> page =
      _i11.PageInfo<RouteDashBoardArgs>(name);
}

class RouteDashBoardArgs {
  const RouteDashBoardArgs({
    this.usuario,
    this.key,
  });

  final _i13.User? usuario;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RouteDashBoardArgs{usuario: $usuario, key: $key}';
  }
}

/// generated route for
/// [_i6.PageForgotPassword]
class RouteForgotPassword extends _i11.PageRouteInfo<RouteForgotPasswordArgs> {
  RouteForgotPassword({
    required String token,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RouteForgotPassword.name,
          args: RouteForgotPasswordArgs(
            token: token,
            key: key,
          ),
          rawPathParams: {'token': token},
          initialChildren: children,
        );

  static const String name = 'RouteForgotPassword';

  static const _i11.PageInfo<RouteForgotPasswordArgs> page =
      _i11.PageInfo<RouteForgotPasswordArgs>(name);
}

class RouteForgotPasswordArgs {
  const RouteForgotPasswordArgs({
    required this.token,
    this.key,
  });

  final String token;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RouteForgotPasswordArgs{token: $token, key: $key}';
  }
}

/// generated route for
/// [_i7.PageHome]
class RouteHome extends _i11.PageRouteInfo<void> {
  const RouteHome({List<_i11.PageRouteInfo>? children})
      : super(
          RouteHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteHome';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PageLogin]
class RouteLogin extends _i11.PageRouteInfo<void> {
  const RouteLogin({List<_i11.PageRouteInfo>? children})
      : super(
          RouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteLogin';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PageRegister]
class RouteRegister extends _i11.PageRouteInfo<void> {
  const RouteRegister({List<_i11.PageRouteInfo>? children})
      : super(
          RouteRegister.name,
          initialChildren: children,
        );

  static const String name = 'RouteRegister';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PageUsers]
class RouteUsers extends _i11.PageRouteInfo<void> {
  const RouteUsers({List<_i11.PageRouteInfo>? children})
      : super(
          RouteUsers.name,
          initialChildren: children,
        );

  static const String name = 'RouteUsers';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
