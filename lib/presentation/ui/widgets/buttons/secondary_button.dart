import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles/colors.dart';
import '../../../../core/utils/styles/ui_helper.dart';
import '../../hooks/is_dark_mode_hook.dart';

class SecondaryButton extends HookWidget {
  const SecondaryButton({
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
      width: horizontalPadding == 18.w ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100).r,
        gradient: UIColors.secondaryGradient,
        boxShadow: isDark
            ? UIColors.secondaryBoxShadowDark
            : UIColors.secondaryBoxShadowLight,
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
          foregroundColor:
              isDark ? UIColors.secondaryColor : UIColors.secondaryColorDark,
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
                  size: 20.sm,
                ),
              if (prefixIconData != null) UIHelper.horizontalSpace(6),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
              ),
              if (suffixIconData != null) UIHelper.horizontalSpace(6),
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
