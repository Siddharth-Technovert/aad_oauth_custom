import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/login/login_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';

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
          decoration: const BoxDecoration(
              // gradient: UIColors.eventBgGradients.first,
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              CustomText.headlineLarge(
                context,
                "Boilerplate App",
              ),
              const Spacer(),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: appLocalization.policyTerm,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    TextSpan(
                      text: appLocalization.policyAcknowledge,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: appLocalization.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    )
                  ],
                ),
              ),
              UIDimensions.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
