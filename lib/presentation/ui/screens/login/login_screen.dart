import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../providers/login/login_provider.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginNotifierProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.headlineLarge(
                context.appLoc.letsGetStarted,
                color: context.primary,
              ),
              UIDimensions.verticalSpace(12),
              CustomText.bodySmall(
                context.appLoc.boilerplateWelcomeMsg,
                textOverflow: null,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              UIDimensions.verticalSpaceLarge,
              TextField(
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: context.appLoc.email,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    size: UIDimensions.icon24,
                  ),
                ),
                onEditingComplete: () async => loginNotifier.logIn(
                  AccountType.guest,
                  isSignInButton: true,
                ),
              ),
              UIDimensions.verticalSpaceMedium,
              PrimaryButton(
                onPressed: () async => loginNotifier.logIn(
                  AccountType.guest,
                  isSignInButton: true,
                ),
                text: context.appLoc.guestLogin,
              ),
              UIDimensions.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
