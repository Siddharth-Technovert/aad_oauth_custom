import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/styles/ui_helper.dart';

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
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(999)).r,
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(999)).r,
            ),
            primary: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              UIHelper.horizontalSpaceSmall,
              Text(
                text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              UIHelper.horizontalSpace(6),
              if (iconData != null)
                Icon(
                  iconData,
                  size: 18.sm,
                  color: Theme.of(context).colorScheme.secondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
