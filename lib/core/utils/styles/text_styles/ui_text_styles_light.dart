import 'package:flutter/widgets.dart';

import '../../assets_gen/fonts.gen.dart';
import '../colors/ui_colors_light.dart';
import '../dimensions/ui_dimensions.dart';
import 'ui_text_styles.dart';

class UITextStylesLight implements UITextStyles {
  UITextStylesLight();

  final UIColorsLight lightColors = UIColorsLight();

  static TextStyle _defaultStyle() => const TextStyle(
        fontFamily: FontFamily.poppins,
      );

  @override
  TextStyle get displayLarge => _defaultStyle().copyWith(
        color: lightColors.customColors.font28Color,
        fontSize: UIDimensions.font28,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get displayMedium => _defaultStyle().copyWith(
        color: lightColors.customColors.font28Color,
        fontSize: UIDimensions.font24,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get displaySmall => _defaultStyle().copyWith(
        color: lightColors.customColors.font20Color,
        fontSize: UIDimensions.font20,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get headlineLarge => _defaultStyle().copyWith(
        color: lightColors.customColors.font18Color,
        fontSize: UIDimensions.font20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headlineMedium => _defaultStyle().copyWith(
        color: lightColors.customColors.font18Color,
        fontSize: UIDimensions.font18,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get headlineSmall => _defaultStyle().copyWith(
        color: lightColors.customColors.font16Color,
        fontSize: UIDimensions.font16,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get titleLarge => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font16,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get titleMedium => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font14,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get titleSmall => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font12,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get bodyLarge => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font16,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get bodyMedium => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font14,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get bodySmall => _defaultStyle().copyWith(
        color: lightColors.customColors.font12Color,
        fontSize: UIDimensions.font12,
        fontWeight: FontWeight.w400,
      );
  @override
  TextStyle get labelLarge => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font16,
        fontWeight: FontWeight.w300,
      );

  @override
  TextStyle get labelMedium => _defaultStyle().copyWith(
        color: lightColors.customColors.font14Color,
        fontSize: UIDimensions.font14,
        fontWeight: FontWeight.w300,
      );

  @override
  TextStyle get labelSmall => _defaultStyle().copyWith(
        color: lightColors.customColors.font12Color,
        fontSize: UIDimensions.font12,
        fontWeight: FontWeight.w300,
      );
}
