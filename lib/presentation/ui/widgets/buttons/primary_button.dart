import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../hooks/is_dark_mode_hook.dart';

class PrimaryButton extends HookWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffixIconData,
    this.prefixIconData,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final IconData? suffixIconData;
  final IconData? prefixIconData;

  @override
  Widget build(BuildContext context) {
    final isDark = useIsDarkHook();
    return Container(
      height: 56.h,
      width: horizontalPadding == 18.w ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100).r,
        gradient: UIColors.primaryGradient,
        boxShadow: isDark
            ? UIColors.dark.primaryBoxShadow
            : UIColors.light.primaryBoxShadow,
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
            borderRadius: BorderRadius.circular(100).r,
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
                  size: 28.sm,
                ),
              if (prefixIconData != null) UIDimensions.horizontalSpace(6),
              Text(
                text,
                style: context.h5.copyWith(
                  color: Colors.white,
                ),
              ),
              if (suffixIconData != null) UIDimensions.horizontalSpace(6),
              if (suffixIconData != null)
                Icon(
                  suffixIconData,
                  color: Colors.white,
                  size: 20.sm,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
