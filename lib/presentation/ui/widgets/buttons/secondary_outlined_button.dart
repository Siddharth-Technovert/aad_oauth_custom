import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  const SecondaryOutlinedButton({
    required this.text,
    this.iconData,
    this.iconSvgPath,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final String? iconSvgPath;
  final IconData? iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.w,
            color: context.secondaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(999)).r,
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(999)).r,
            ),
            foregroundColor: context.secondaryColor,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconSvgPath != null)
                SvgPicture.asset(
                  iconSvgPath!,
                  height: 18.h,
                  width: 18.w,
                  color: context.secondaryColor,
                ),
              UIDimensions.horizontalSpaceSmall,
              Text(
                text,
                style: context.h6.copyWith(
                  color: context.secondaryColor,
                ),
              ),
              UIDimensions.horizontalSpace(6),
              if (iconData != null)
                Icon(
                  iconData,
                  size: 18.sm,
                  color: context.secondaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
