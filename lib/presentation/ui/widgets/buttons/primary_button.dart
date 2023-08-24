import 'package:flutter/material.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? _onPressed;
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final Widget? suffix;
  final Widget? prefix;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? height;
  final Widget? child;
  final double? cornerRadius;

  const PrimaryButton({
    required this.text,
    required VoidCallback onPressed,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffix,
    this.prefix,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.child,
    this.height,
    this.cornerRadius,
    super.key,
  }) : _onPressed = onPressed;

  const PrimaryButton.disabled({
    required this.text,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.suffix,
    this.prefix,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.child,
    this.height,
    this.cornerRadius,
    super.key,
  }) : _onPressed = null;

  @override
  Widget build(BuildContext context) {
    return UIDimensions.sizedBox(
      height: (height ?? UIDimensions.buttonH56),
      width:
          horizontalPadding == UIDimensions.buttonW18 ? double.infinity : null,
      // decoration: roundCornerSolidBg(
      //   bgColor: context.primaryColor,
      //   isShadowVisible: true,
      // ),
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          padding: UIDimensions.symmetricPaddingGeometry(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefix != null) prefix!,
              Padding(
                padding: UIDimensions.symmetricPaddingGeometry(horizontal: 6),
                child: child ??
                    CustomText.titleMedium(
                      text,
                    ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}
