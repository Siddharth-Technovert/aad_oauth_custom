import 'package:flutter/material.dart';

import '../../../core/utils/extensions/context_extension.dart';
import '../../../core/utils/styles/dimensions/ui_dimensions.dart';

class CustomText extends StatelessWidget {
  final _TextStyleType _textStyleType;
  final String _text;
  final int? _maxLines;
  final TextAlign? _textAlign;
  final bool? _softWrap;
  final Color? _color;
  final FontWeight? _fontWeight;
  final TextOverflow? _textOverflow;
  final double? _letterSpacing;
  final FontStyle? _fontStyle;
  final double? _fontSize;
  final TextDecoration? _decoration;
  final double? _height;

  const CustomText._(
    String text, {
    required _TextStyleType textStyleType,
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
  })  : _text = text,
        _maxLines = maxLines,
        _textAlign = textAlign,
        _softWrap = softWrap,
        _textOverflow = textOverflow,
        _textStyleType = textStyleType,
        _color = color,
        _fontWeight = fontWeight,
        _letterSpacing = letterSpacing,
        _fontStyle = fontStyle,
        _fontSize = fontSize,
        _decoration = decoration,
        _height = height;

  const CustomText.displayLarge(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.displayLarge,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.displayMedium(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.displayMedium,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.displaySmall(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.displaySmall,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.headlineLarge(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.headlineLarge,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.headlineMedium(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.headlineMedium,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.headlineSmall(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.headlineSmall,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.titleLarge(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.titleLarge,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.titleMedium(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.titleMedium,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.titleSmall(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.titleSmall,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.bodyLarge(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.bodyLarge,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.bodyMedium(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.bodyMedium,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.bodySmall(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.bodySmall,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  const CustomText.labelLarge(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.labelLarge,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );
  const CustomText.labelMedium(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.labelMedium,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );
  const CustomText.labelSmall(
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
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          softWrap: softWrap,
          textOverflow: textOverflow,
          textStyleType: _TextStyleType.labelSmall,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontSize: fontSize,
          decoration: decoration,
          height: height,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: context.style(_textStyleType).copyWith(
            color: _color,
            height: _height,
            decoration: _decoration,
            fontWeight: _fontWeight,
            fontSize:
                _fontSize == null ? null : UIDimensions.fontSize(_fontSize!),
            overflow: _textOverflow,
            letterSpacing: _letterSpacing,
            fontStyle: _fontStyle,
          ),
      maxLines: _maxLines,
      textAlign: _textAlign,
      softWrap: _softWrap,
      overflow: _textOverflow,
    );
  }
}

enum _TextStyleType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

extension _TextStyleTypeExtension on BuildContext {
  TextStyle style(_TextStyleType type) {
    return switch (type) {
      _TextStyleType.displayLarge => displayLarge,
      _TextStyleType.displayMedium => displayMedium,
      _TextStyleType.displaySmall => displaySmall,
      _TextStyleType.headlineLarge => headlineLarge,
      _TextStyleType.headlineMedium => headlineMedium,
      _TextStyleType.headlineSmall => headlineSmall,
      _TextStyleType.titleLarge => titleLarge,
      _TextStyleType.titleMedium => titleMedium,
      _TextStyleType.titleSmall => titleSmall,
      _TextStyleType.bodyLarge => bodyLarge,
      _TextStyleType.bodyMedium => bodyMedium,
      _TextStyleType.bodySmall => bodySmall,
      _TextStyleType.labelLarge => labelLarge,
      _TextStyleType.labelMedium => labelMedium,
      _TextStyleType.labelSmall => labelSmall,
    };
  }
}
