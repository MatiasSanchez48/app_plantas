import 'package:flutter/material.dart';

// TODO: Add description
final themeDefault = ThemeData(
  fontFamily: 'Nunito',
  colorScheme: themeDefaultPlants,
  useMaterial3: true,
);

// TODO: Add description
const themeDefaultPlants = ColorScheme.light(
  primary: Color(0xff170E68),
  onPrimary: Color(0xffEEEEEE),
  primaryContainer: Color(0xff6788FF),
  background: Color(0xffFFFFFF),
  onBackground: Color(0xff1E1E1E),
  secondary: Color(0xffC0C0C0),
  onSecondary: Color(0xff979797),
  tertiary: Color(0xffF2F2F2),
  onTertiary: Color(0xffE1E1E1),
  error: Color(0xffFF4444),
  surfaceTint: Color(0xFFFFFFFF),
);
