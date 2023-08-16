import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/login/login_provider.dart';
import '../../../providers/signup/signup_provider.dart';
import '../../hooks/app_loc_hook.dart';

class AuthButton extends HookConsumerWidget {
  const AuthButton(
    this.accountType, {
    required this.onPressed,
    this.horizontalPadding = 18,
    this.verticalPadding = 16,
    this.isSignInButton = true,
    this.isSuccessButton = false,
    super.key,
  });
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;

  final AccountType accountType;
  final bool isSignInButton;
  final bool isSuccessButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    final btnText = isSignInButton ? appLoc.signIn : appLoc.signUp;

    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        color: context.primaryColor,
        shadows: UIColors.light.primaryBoxShadow,
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
        child: isSignInButton
            ? ref.watch(loginProvider).maybeWhen(
                  loading: (a) => a == accountType
                      ? SizedBox(
                          width: 36,
                          height: 35,
                          child: CircularProgressIndicator(
                              color: UIColors.light.primaryShade),
                        )
                      : const SizedBox.shrink(),
                  orElse: () => Text(btnText),
                )
            : ref.watch(signUpProvider).maybeWhen(
                  loading: (a) => a == accountType
                      ? SizedBox(
                          width: 36,
                          height: 35,
                          child: CircularProgressIndicator(
                              color: UIColors.light.primaryShade),
                        )
                      : const SizedBox.shrink(),
                  orElse: () => Text(btnText),
                ),
      ),
    );
  }
}
