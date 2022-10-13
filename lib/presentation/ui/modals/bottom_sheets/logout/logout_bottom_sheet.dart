import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../providers/core/router_provider.dart';
import '../../../../providers/home/home_provider.dart';
import '../../../hooks/app_loc_hook.dart';
import '../../../hooks/is_dark_mode_hook.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/secondary_outlined_button.dart';

class LogoutBottomSheet extends HookConsumerWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = useIsDarkHook();
    final appLoc = useAppLoc();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff2d2d30) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          UIDimensions.verticalSpaceMedium,
          UIDimensions.verticalSpaceSmall,
          Center(
            child: Text(
              appLoc.logout,
              style: context.h3,
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          Center(
            child: SizedBox(
              width: 193,
              child: Text(
                appLoc.logoutConfirm,
                textAlign: TextAlign.center,
                style: context.h6,
              ),
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          PrimaryButton(
            onPressed: () async {
              ref.read(appRouterProvider).pop();
              ref.read(homeProvider.notifier).logout();
            },
            text: appLoc.logout,
          ),
          UIDimensions.verticalSpaceMedium,
          SecondaryOutlinedButton(
            onPressed: () => ref.read(appRouterProvider).pop(),
            text: appLoc.cancel,
          ),
          UIDimensions.verticalSpaceMedium,
        ],
      ),
    );
  }
}
