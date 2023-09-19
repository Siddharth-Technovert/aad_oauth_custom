import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIDimensions {
  static final double statusBarHeight = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single)
      .padding
      .top;

  static final double homeIndicatorHeight = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single)
      .viewPadding
      .bottom;

  static const Widget verticalSpaceSmall = RSizedBox(height: 8);
  static const Widget verticalSpaceMedium = RSizedBox(height: 16);
  static const Widget verticalSpaceLarge = RSizedBox(height: 32);
  static Widget verticalSpace(double height) => RSizedBox(height: height);

  static const Widget horizontalSpaceSmall = RSizedBox(width: 8);
  static const Widget horizontalSpaceMedium = RSizedBox(width: 16);
  static const Widget horizontalSpaceLarge = RSizedBox(width: 32);
  static Widget horizontalSpace(double width) => RSizedBox(width: width);

  static Padding padding({
    required EdgeInsets padding,
    required Widget child,
  }) =>
      Padding(
        padding: REdgeInsets.fromLTRB(
          padding.left,
          padding.top,
          padding.right,
          padding.bottom,
        ),
        child: child,
      );

  static Padding horizontalPadding({
    EdgeInsets? padding,
    required Widget child,
  }) =>
      Padding(
        padding: padding != null
            ? REdgeInsets.fromLTRB(
                padding.left,
                padding.top,
                padding.right,
                padding.bottom,
              )
            : REdgeInsets.symmetric(horizontal: 16),
        child: child,
      );

  static Radius radiusCircular(
    double radius,
  ) =>
      Radius.circular(radius).w;

  static Radius radiusElliptical(
    double x,
    double y,
  ) =>
      Radius.elliptical(x, y).w;

  static SizedBox sizedBox({
    double? height,
    double? width,
    required Widget child,
  }) =>
      RSizedBox(
        height: height,
        width: width,
        child: child,
      );

  static EdgeInsetsGeometry symmetricPaddingGeometry({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      REdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );

  static EdgeInsetsGeometry lTWRPaddingGeometry({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      REdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      );

  static EdgeInsetsGeometry allPaddingGeometry(double val) =>
      REdgeInsets.all(val);

  ///? Font Sizes
  /// You can use these directly if you need, but usually there should be a predefined style in TextStyles
  static double font28 = 28.sp;
  static double font24 = 24.sp;
  static double font20 = 20.sp;
  static double font18 = 18.sp;
  static double font16 = 16.sp;
  static double font14 = 14.sp;
  static double font12 = 12.sp;
  static double fontSize(double val) => val.sp;

  //? Icon Sizes
  static double icon24 = 24.sp;
  static double icon16 = 16.sp;
  static double icon8 = 8.sp;
  static double iconSize(double val) => val.sp;

  //? Radius
  static double imageR28 = 28.r;
  static double buttonR28 = 28.r;
  static double buttonR24 = 24.r;
  static double buttonR4 = 4.r;
  static double cardR24 = 24.r;
  static double cardR4 = 4.r;
  static double radius(double val) => val.r;

  //?Width
  static double buttonW18 = 18.w;
  static double width(double val) => val.w;

  //?Height
  static double buttonH56 = 56.h;
  static double height(double val) => val.h;

  //?Input Decoration
  static OutlineInputBorder inputDecorationBorder(
    Color borderColor, [
    double borderWidth = 1.0,
  ]) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
}
