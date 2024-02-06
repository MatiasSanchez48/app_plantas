import 'package:flutter/material.dart';

extension PlantsColorScheme on ColorScheme {
  Color get primaryOpacity30 => primary.withOpacity(.3);

  Color get primaryOpacity50 => primary.withOpacity(.5);

  Color get primaryOpacity80 => primary.withOpacity(.8);

  Color get greySubTitle => const Color(0xff262D33);

  Color get blue => const Color.fromARGB(255, 1, 106, 253);

  Color get yellow => const Color.fromARGB(255, 245, 237, 0);

  Color get black => const Color(0xff000000);

  Color get greyNotImage => const Color(0xffD4D4D4);
}
