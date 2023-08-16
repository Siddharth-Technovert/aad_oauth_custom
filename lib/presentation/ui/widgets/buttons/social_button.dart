import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/styles/decorations/corner_shape_decoration.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onPressed,
    this.width,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.svg,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double? width;
  final double horizontalPadding;
  final double verticalPadding;
  final SvgPicture? svg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: smoothCornerShape().copyWith(
            side: const BorderSide(
              width: 0.5,
              color: Color(0XFFD8DDE6),
            ),
          ),
        ),
        child: Center(
          child: svg,
        ),
      ),
    );
  }
}
