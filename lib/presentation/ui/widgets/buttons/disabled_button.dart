import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../core/utils/styles/decorations/corner_shape_decoration.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class DisabledButton extends HookWidget {
  const DisabledButton({
    required this.text,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffixIconData,
    this.prefixIconData,
    Key? key,
  }) : super(key: key);

  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData? suffixIconData;
  final IconData? prefixIconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: horizontalPadding == 18.w ? double.infinity : null,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          elevation: 0,
          shape: smoothCornerShape(),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIconData != null)
                Icon(
                  prefixIconData,
                  color: UIColors.light.slate800,
                  size: 28.sp,
                ),
              if (prefixIconData != null) UIDimensions.horizontalSpace(6),
              Text(
                text,
                style: context.h5.copyWith(
                  fontWeight: FontWeight.w400,
                  color: UIColors.light.slate800,
                ),
              ),
              if (suffixIconData != null) UIDimensions.horizontalSpace(6),
              if (suffixIconData != null)
                Icon(
                  suffixIconData,
                  color: UIColors.light.slate800,
                  size: 20.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
