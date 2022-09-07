import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/styles/colors.dart';
import '../../../../core/utils/styles/ui_helper.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/core/theme_state_provider.dart';
import '../../../providers/login/login_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../widgets/buttons/primary_button.dart';

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
            gradient: UIColors.eventBgGradients.first,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontSize: 28.sp,
                    ),
              ),
              UIHelper.verticalSpace(64),
              GoogleAuthButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.google,
                  isSignInButton: true,
                ),
                themeMode: ref.read(themeModeProvider),
              ),
              UIHelper.verticalSpaceMedium,
              FacebookAuthButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.facebook,
                  isSignInButton: true,
                ),
                themeMode: ref.read(themeModeProvider),
              ),
              UIHelper.verticalSpaceMedium,
              PrimaryButton(
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
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    TextSpan(
                      text: appLocalization.policyTerm,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                    ),
                    TextSpan(
                      text: appLocalization.policyAcknowledge,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    TextSpan(
                      text: appLocalization.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(64),
            ],
          ),
        ),
      ),
    );
  }
}
