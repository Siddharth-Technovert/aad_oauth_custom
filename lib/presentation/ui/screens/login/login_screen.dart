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
        body: UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText.headlineLarge(
                "Lets Get Started",
              ),
              UIDimensions.verticalSpace(12),
              const CustomText.bodySmall(
                "A Boilerplate App to let you get started for building the project",
                textOverflow: null,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              UIDimensions.verticalSpaceLarge,
              TextField(
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w500),
                decoration: const InputDecoration(hintText: "Email"),
              ),
              UIDimensions.verticalSpaceMedium,
              PrimaryButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.guest,
                  isSignInButton: true,
                ),
                text: "Guest Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
