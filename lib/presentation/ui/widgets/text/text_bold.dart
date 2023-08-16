import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';

class TextBold extends StatelessWidget {
  ///TextView has [darkBlue] in light theme and [colorWhite] in dark or see [lightTheme] and [darkTheme]

  const TextBold(
    this.text, {
    Key? key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textOverflow = TextOverflow.ellipsis,
    this.letterSpacing,
    this.fontStyle,
    this.maxLines,
    this.textAlign,
    this.softWrap,
    this.height,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final int? maxLines;
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
      style: context.h6.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize?.sp,
        overflow: textOverflow,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        height: height,
      ),
    );
  }
}
