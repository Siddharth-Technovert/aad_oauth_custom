import 'package:flutter/material.dart';

import '../../../core/utils/extensions/context_extension.dart';
import '../../../core/utils/styles/dimensions/ui_dimensions.dart';

class CustomText extends Text {
  CustomText.displayLarge(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.displayLarge.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.displayMedium(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.displayMedium.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.displaySmall(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.displaySmall.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.headlineLarge(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.headlineLarge.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.headlineMedium(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.headlineMedium.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.headlineSmall(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.headlineSmall.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.titleLarge(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.titleLarge.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.titleMedium(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.titleMedium.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.titleSmall(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.titleSmall.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.bodyLarge(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.bodyLarge.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );

  CustomText.bodyMedium(
    BuildContext context,
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? fontSize,
    int? maxLines,
    TextDecoration? decoration,
    TextAlign? textAlign,
    double? height,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: textOverflow,
          style: context.bodyMedium.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize == null ? null : UIDimensions.fontSize(fontSize),
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
        );
}
