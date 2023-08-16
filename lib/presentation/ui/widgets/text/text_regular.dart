import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRegular extends StatelessWidget {
  ///TextView has [primaryColor] in light theme and [colorWhite] in dark style normal or
  /// see [lightTheme] and [darkTheme]

  const TextRegular(
    this.text, {
    Key? key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textOverflow = TextOverflow.ellipsis,
    this.letterSpacing,
    this.fontStyle,
    this.maxLines,
    this.decoration,
    this.textAlign,
    this.height,
    this.softWrap,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final bool? softWrap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: textOverflow,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            height: height,
            decoration: decoration,
            fontWeight: fontWeight,
            fontSize: fontSize?.sp,
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
    );
  }
}
