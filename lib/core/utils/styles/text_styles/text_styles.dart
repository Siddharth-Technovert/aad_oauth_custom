import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';

part 'text_styles_dark.dart';
part 'text_styles_light.dart';

class UITextStyles {
  const UITextStyles._();

  static const TextStylesLight light = TextStylesLight();
  static const TextStylesDark dark = TextStylesDark();

  static TextStyle defaultStyle() => const TextStyle(
        fontFamily: 'Urbanist',
        letterSpacing: 0.5,
      );

  static TextStyle defaultButtonStyle() => defaultStyle().copyWith(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      );
}
