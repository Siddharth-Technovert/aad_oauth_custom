import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/login/login_provider.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: const BoxDecoration(
              // gradient: UIColors.eventBgGradients.first,
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const CustomText.headlineLarge(
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
                      text: context.appLoc.policyAgree,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: context.appLoc.policyTerm,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    TextSpan(
                      text: context.appLoc.policyAcknowledge,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: context.appLoc.privacyPolicy,
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
