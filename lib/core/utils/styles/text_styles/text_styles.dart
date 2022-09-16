import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';

part 'text_styles_light.dart';
part 'text_styles_dark.dart';

class UITextStyles {
  const UITextStyles._();

  static const _TextStylesDark dark = _TextStylesDark();
  static const _TextStylesLight light = _TextStylesLight();

  static TextStyle defaultStyle() => const TextStyle(
        letterSpacing: 0.2,
      );

  static TextStyle defaultButtonStyle() => defaultStyle().copyWith(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      );
}
