import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/decorations/corner_shape_decoration.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class PrimaryButton extends HookWidget {
  const PrimaryButton({
    this.onPressed,
    this.text,
    this.widget,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffixIconData,
    this.prefixIconData,
    this.height = 60,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final double height;
  final String? text;
  final Widget? widget;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData? suffixIconData;
  final IconData? prefixIconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: horizontalPadding == 18.w ? double.infinity : null,
      decoration: roundCornerSolidBg(
        bgColor: context.primaryColor,
        isShadowVisible: true,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16).r,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIconData != null)
                Icon(
                  prefixIconData,
                  color: Colors.white,
                  size: 28.sp,
                ),
              if (prefixIconData != null) UIDimensions.horizontalSpace(6),
              if (text != null)
                Text(
                  text!,
                  style: context.h5.copyWith(
                    color: Colors.white,
                  ),
                ),
              if (widget != null) widget!,
              if (suffixIconData != null) UIDimensions.horizontalSpace(6),
              if (suffixIconData != null)
                Icon(
                  suffixIconData,
                  color: Colors.white,
                  size: 20.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
