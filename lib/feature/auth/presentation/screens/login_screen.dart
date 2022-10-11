import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../shared/domain/enums/account_type.dart';
import '../../../../shared/presentation/providers/theme_state_provider.dart';
import '../../../../shared/presentation/ui/hooks/app_loc_hook.dart';
import '../../../../shared/presentation/ui/widgets/buttons/secondary_button.dart';
import '../providers/login_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);
    final appLocalization = useAppLoc();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            gradient: UIColors.primaryGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                "Login",
                style: context.h1.copyWith(
                  color: Colors.white,
                ),
              ),
              UIDimensions.verticalSpace(64),
              GoogleAuthButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.google,
                  isSignInButton: true,
                ),
                themeMode: ref.watch(themeStateProvider).mode,
              ),
              UIDimensions.verticalSpaceMedium,
              FacebookAuthButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.facebook,
                  isSignInButton: true,
                ),
                themeMode: ref.watch(themeStateProvider).mode,
              ),
              UIDimensions.verticalSpaceMedium,
              SecondaryButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.guest,
                  isSignInButton: true,
                ),
                text: "Guest Login",
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: appLocalization.policyAgree,
                      style: context.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLocalization.policyTerm,
                      style: context.bodyText1.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLocalization.policyAcknowledge,
                      style: context.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLocalization.privacyPolicy,
                      style: context.bodyText1.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              UIDimensions.verticalSpace(64),
            ],
          ),
        ),
      ),
    );
  }
}