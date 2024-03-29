import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template RouterObserver}
/// Esto se encarga de mostrar por consola el nombre de la ruta a la que se va
/// a navegar
/// {@endtemplate}
class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('new router push: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('returned router: ${route.settings.name}');
  }
}
