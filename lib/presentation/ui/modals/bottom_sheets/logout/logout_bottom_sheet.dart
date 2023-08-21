import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../providers/core/router_provider.dart';
import '../../../../providers/home/home_provider.dart';
import '../../../hooks/app_loc_hook.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/secondary_button.dart';
import '../../../widgets/custom_text.dart';

class LogoutBottomSheet extends HookConsumerWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return UIDimensions.padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: CustomText.headlineLarge(
              context,
              appLoc.logout,
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          Center(
            child: SizedBox(
              child: CustomText.headlineSmall(
                context,
                appLoc.logoutConfirm,
                textAlign: TextAlign.center,
                textOverflow: null,
              ),
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          PrimaryButton(
            onPressed: () async {
              await ref.read(homeProvider.notifier).logout();
            },
            text: appLoc.logout,
          ),
          UIDimensions.verticalSpaceMedium,
          SecondaryButton(
            onPressed: () => ref.read(appRouterProvider).pop(),
            text: appLoc.cancel,
          ),
          UIDimensions.verticalSpaceMedium,
        ],
      ),
    );
  }
}
