import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Extension for String
extension StringsX on String {
  /// Capitalizes the first letter of the name
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Returns the first letter of the name
  String initalsName() {
    if (isEmpty) {
      return 'NN';
    } else {
      final name = split(' ');
      if (name.length == 1) {
        return name[0][0].toUpperCase();
      }
      return name[0][0].toUpperCase() + name[1][0].toUpperCase();
    }
  }

  String nameRoute(BuildContext context) {
    return switch (context.topRoute.name) {
      RouteConfiguration.name => 'Configuration', // TODO: l10n.
      _ => '',
    };
  }
}
