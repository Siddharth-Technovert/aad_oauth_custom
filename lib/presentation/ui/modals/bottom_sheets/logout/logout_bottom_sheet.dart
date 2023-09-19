import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../providers/core/router_provider.dart';
import '../../../../providers/home/home_provider.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/secondary_button.dart';
import '../../../widgets/custom_text.dart';

@RoutePage(name: "LogoutBottomSheetRoute")
class LogoutBottomSheet extends ConsumerWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UIDimensions.padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: CustomText.headlineMedium(
              context.appLoc.logout,
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          Center(
            child: SizedBox(
              child: CustomText.titleMedium(
                context.appLoc.logoutConfirmation,
                textAlign: TextAlign.center,
                textOverflow: null,
              ),
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          PrimaryButton(
            onPressed: () async {
              await ref.read(homeNotifierProvider.notifier).logout();
            },
            text: context.appLoc.logout,
          ),
          UIDimensions.verticalSpaceMedium,
          SecondaryButton(
            onPressed: () => ref.read(appRouterProvider).pop(),
            text: context.appLoc.cancel,
          ),
          UIDimensions.verticalSpaceMedium,
        ],
      ),
    );
  }
}
