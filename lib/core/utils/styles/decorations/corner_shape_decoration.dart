import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';

SmoothBorderRadius smoothBorderRadius({double? cornerRadius}) {
  return SmoothBorderRadius(
    cornerRadius: cornerRadius?.r ?? 16.r,
    cornerSmoothing: 1,
  );
}

SmoothRectangleBorder smoothCornerShape({double? cornerRadius}) {
  return SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius(
      cornerRadius: cornerRadius?.r ?? 16.r,
      cornerSmoothing: 1,
    ),
  );
}

ShapeDecoration smoothCornerShadowDecoration({
  ImageProvider? imageProvider,
  bool addColorLayer = false,
  double? cornerRadius,
  BoxFit? boxFit,
  bool? isShadow,
  bool? isGradient,
  Color? bgColor,
}) =>
    ShapeDecoration(
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: cornerRadius ?? 16,
          cornerSmoothing: 1,
        ),
      ),
      shadows: isShadow == true
          ? const [
              BoxShadow(
                offset: Offset(4, 8),
                blurRadius: 18,
                color: Color.fromRGBO(106, 121, 139, 0.12),
              )
            ]
          : null,
      gradient: isGradient == true
          ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // end: Alignment(cos(132 * pi / 180), sin(132 * pi / 180)),
              colors: [
                Color.fromRGBO(0, 0, 0, 0.7),
                Color.fromRGBO(0, 0, 0, 0),
              ],
              stops: [0.0, 0.7],
            )
          : null,
      image: imageProvider == null
          ? null
          : DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
              colorFilter: addColorLayer
                  ? const ColorFilter.mode(
                      Color.fromRGBO(13, 13, 13, 0.5),
                      BlendMode.srcATop,
                    )
                  : null,
            ),
    );

ShapeDecoration circularShapeDecoration({Color? bgColor}) => ShapeDecoration(
      color: bgColor ?? UIColors.light.primaryShade,
      shape: const CircleBorder(),
    );

ShapeDecoration roundCornerSolidBg({
  Color? bgColor,
  double? borderRadius,
  bool isBorderVisible = true,
  Color? borderColor,
  double? borderWidth,
  List<BoxShadow>? shadowColor,
  bool isShadowVisible = false,
}) =>
    ShapeDecoration(
      color: bgColor ?? UIColors.light.background,
      shadows:
          isShadowVisible ? shadowColor ?? UIColors.light.cardBoxShadow : null,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: borderRadius ?? 16,
          cornerSmoothing: 1,
        ),
        side: isBorderVisible
            ? BorderSide(
                color: borderColor ?? UIColors.light.slate10,
                width: borderWidth ?? 0.5,
              )
            : BorderSide.none,
      ),
    );

ShapeDecoration roundCornerOnlyTopSolidBg({
  Color? bgColor,
  double? borderRadius,
  bool isBorderVisible = true,
  Color? borderColor,
  double? borderWidth,
  List<BoxShadow>? shadowColor,
  bool isShadowVisible = false,
}) =>
    ShapeDecoration(
      color: bgColor ?? UIColors.light.background,
      shadows:
          isShadowVisible ? shadowColor ?? UIColors.light.cardBoxShadow : null,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.only(
          topLeft: SmoothRadius(
            cornerRadius: borderRadius ?? 16,
            cornerSmoothing: 1,
          ),
          topRight: SmoothRadius(
            cornerRadius: borderRadius ?? 16,
            cornerSmoothing: 1,
          ),
        ),
        side: isBorderVisible
            ? BorderSide(
                color: borderColor ?? UIColors.light.slate10,
                width: borderWidth ?? 0.5,
              )
            : BorderSide.none,
      ),
    );

ShapeDecoration bottomCornerSolidBg({
  Color? bgColor,
  double? borderRadius,
  bool isBorderVisible = true,
  Color? borderColor,
  double? borderWidth,
  List<BoxShadow>? shadowColor,
  bool isShadowVisible = false,
}) =>
    ShapeDecoration(
      color: bgColor ?? UIColors.light.background,
      shadows:
          isShadowVisible ? shadowColor ?? UIColors.light.cardBoxShadow : null,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.only(
          bottomLeft: SmoothRadius(
            cornerRadius: borderRadius ?? 16,
            cornerSmoothing: 1,
          ),
          bottomRight: SmoothRadius(
            cornerRadius: borderRadius ?? 16,
            cornerSmoothing: 1,
          ),
        ),
        side: isBorderVisible
            ? BorderSide(
                color: borderColor ?? UIColors.light.slate10,
                width: borderWidth ?? 0.5,
              )
            : BorderSide.none,
      ),
    );
