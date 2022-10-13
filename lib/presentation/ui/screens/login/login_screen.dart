import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../../../domain/states/login/login_state.dart';
import '../../../providers/core/theme_state_provider.dart';
import '../../../providers/login/login_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../modals/toasts/toast_factory.dart';
import '../../widgets/buttons/secondary_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);
    final appLoc = useAppLoc();

    ref.listen<LoginState>(loginProvider, (prev, next) {
      next.whenOrNull(
        error: (ex) => ToastFactory.showToast(
          context,
          ToastType.error,
          ex.msg(context),
        ),
      );
    });

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
                appLoc.login,
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
                text: appLoc.guestLogin,
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: appLoc.policyAgree,
                      style: context.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLoc.policyTerm,
                      style: context.bodyText1.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLoc.policyAcknowledge,
                      style: context.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: appLoc.privacyPolicy,
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
