import 'package:flutter/material.dart';

part 'colors_dark.dart';
part 'colors_light.dart';

class UIColors {
  static const _ColorsLight light = _ColorsLight();
  static const _ColorsDark dark = _ColorsDark();

  static Gradient get primaryGradient => LinearGradient(
        colors: [light.primary, const Color(0xff7237ac)],
      );
  static Gradient get secondaryGradient => LinearGradient(
        colors: [light.secondary, const Color(0xffbc3f79)],
      );
}
