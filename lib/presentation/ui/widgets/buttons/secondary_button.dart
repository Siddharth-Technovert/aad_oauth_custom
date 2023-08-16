import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/decorations/corner_shape_decoration.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.text,
    required this.onPressed,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffixIconData,
    this.prefixIconData,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.child,
    this.height,
    this.cornerRadius,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? height;
  final Widget? child;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      width: horizontalPadding == 18.w ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor ?? context.primaryColor),
          shape: smoothCornerShape(cornerRadius: cornerRadius),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          foregroundColor: foregroundColor ?? context.primaryColor,
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIconData != null)
                Icon(
                  prefixIconData,
                  color: context.primaryColor,
                  size: 28.sp,
                ),
              if (prefixIconData != null) UIDimensions.horizontalSpace(6),
              child ??
                  Text(
                    text,
                    style: context.h5.copyWith(
                      color: context.primaryColor,
                    ),
                  ),
              if (suffixIconData != null) UIDimensions.horizontalSpace(6),
              if (suffixIconData != null)
                Icon(
                  suffixIconData,
                  color: context.primaryColor,
                  size: 20.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
