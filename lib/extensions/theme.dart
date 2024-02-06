import 'package:flutter/material.dart';

extension ThemeDataX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
