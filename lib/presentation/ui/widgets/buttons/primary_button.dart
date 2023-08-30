import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/context_extension.dart';
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
    this.cornerRadius,
    super.key,
  }) : _onPressed = null;

  @override
  Widget build(BuildContext context) {
    return UIDimensions.sizedBox(
      width: UIDimensions.width(horizontalPadding) == UIDimensions.buttonW18
          ? double.infinity
          : null,
      child: FilledButton(
        onPressed: _onPressed,
        style: FilledButton.styleFrom(
          side: borderColor == null ? null : BorderSide(color: borderColor!),
          // shape: smoothCornerShape(cornerRadius: cornerRadius),
          padding: UIDimensions.symmetricPaddingGeometry(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
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
                      color: context.colorScheme.onPrimary,
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
