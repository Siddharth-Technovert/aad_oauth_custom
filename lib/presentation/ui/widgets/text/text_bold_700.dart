import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBold700 extends StatelessWidget {
  ///TextView has [darkBlue] in light theme and [colorWhite] in dark or see [lightTheme] and [darkTheme]

  const TextBold700(
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

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize?.sp,
            overflow: textOverflow,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
    );
  }
}
