import 'dart:convert';

import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isSignedIn = _sharedPreferences.get('usuario') != null;

    if (!isSignedIn) {
      return router.replace<void>(const RouteLogin());
    }

    return resolver.next();
  }
}

class InitialGuard extends AutoRouteGuard {
  InitialGuard({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final repoAuth = RepositoryAuth();
    final usuario = _sharedPreferences.get('usuario');

    if (usuario != null) {
      final usuarioMap = jsonDecode(usuario.toString());
      final modelUsuario = User.fromJson(usuarioMap as Map<String, dynamic>);

      final usuarioStash =
          await repoAuth.getUsuarioById(id: modelUsuario.id ?? '');

      return router.push<void>(
        RouteDashBoard(usuario: usuarioStash),
      );
    }

    return resolver.next();
  }
}
