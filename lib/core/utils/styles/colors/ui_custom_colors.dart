import 'package:flutter/material.dart';

//?Use this custom color from context extensions customColors getter
@immutable
class UICustomColors extends ThemeExtension<UICustomColors> {
  const UICustomColors({
    required this.font28Color,
    required this.font24Color,
    required this.font20Color,
    required this.font18Color,
    required this.font16Color,
    required this.font14Color,
    required this.font12Color,
    required this.whiteColor,
    required this.blackColor,
    required this.redColor,
    required this.greenColor,
    required this.greyColor,
    required this.marinerColor,
    required this.loadingIndicatorColor,
  });

  final Color? font28Color;
  final Color? font24Color;
  final Color? font20Color;
  final Color? font18Color;
  final Color? font16Color;
  final Color? font14Color;
  final Color? font12Color;
  final Color? whiteColor;
  final Color? blackColor;
  final Color? redColor;
  final Color? greenColor;
  final Color? greyColor;
  final Color? marinerColor;
  final Color? loadingIndicatorColor;

  @override
  UICustomColors copyWith({
    Color? font40Color,
    Color? font28Color,
    Color? font24Color,
    Color? font20Color,
    Color? font18Color,
    Color? font16Color,
    Color? font14Color,
    Color? font12Color,
    Color? whiteColor,
    Color? blackColor,
    Color? redColor,
    Color? greenColor,
    Color? greyColor,
    Color? orangeColor,
    Color? marinerColor,
    Color? loadingIndicatorColor,
  }) {
    return UICustomColors(
      font28Color: font28Color ?? this.font28Color,
      font24Color: font24Color ?? this.font24Color,
      font20Color: font20Color ?? this.font20Color,
      font18Color: font18Color ?? this.font18Color,
      font16Color: font16Color ?? this.font16Color,
      font14Color: font14Color ?? this.font14Color,
      font12Color: font12Color ?? this.font12Color,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      redColor: redColor ?? this.redColor,
      greenColor: greenColor ?? this.greenColor,
      greyColor: greyColor ?? this.greyColor,
      marinerColor: marinerColor ?? this.marinerColor,
      loadingIndicatorColor:
          loadingIndicatorColor ?? this.loadingIndicatorColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  UICustomColors lerp(ThemeExtension<UICustomColors>? other, double t) {
    if (other is! UICustomColors) {
      return this;
    }
    return UICustomColors(
      font28Color: Color.lerp(font28Color, other.font28Color, t),
      font24Color: Color.lerp(font24Color, other.font24Color, t),
      font20Color: Color.lerp(font20Color, other.font20Color, t),
      font18Color: Color.lerp(font18Color, other.font18Color, t),
      font16Color: Color.lerp(font16Color, other.font16Color, t),
      font14Color: Color.lerp(font14Color, other.font14Color, t),
      font12Color: Color.lerp(font12Color, other.font12Color, t),
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t),
      blackColor: Color.lerp(blackColor, other.blackColor, t),
      redColor: Color.lerp(redColor, other.redColor, t),
      greenColor: Color.lerp(greenColor, other.greenColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      marinerColor: Color.lerp(marinerColor, other.marinerColor, t),
      loadingIndicatorColor:
          Color.lerp(loadingIndicatorColor, other.loadingIndicatorColor, t),
    );
  }

  @override
  String toString() {
    return 'UICustomColors(font28Color: $font28Color, font24Color: $font24Color, font20Color: $font20Color, font18Color: $font18Color, font16Color: $font16Color, font14Color: $font14Color, font12Color: $font12Color, whiteColor: $whiteColor, blackColor: $blackColor, redColor: $redColor, greenColor: $greenColor, greyColor: $greyColor, marinerColor: $marinerColor, loadingIndicatorColor: $loadingIndicatorColor)';
  }
}
