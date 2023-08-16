import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../providers/core/router_provider.dart';
import '../../../../providers/home/home_provider.dart';
import '../../../hooks/app_loc_hook.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/secondary_button.dart';

class LogoutBottomSheet extends HookConsumerWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16).w,
        child: Column(
          children: [
            Center(
              child: Text(
                appLoc.logout,
                style: context.h3,
              ),
            ),
            UIDimensions.verticalSpaceMedium,
            Center(
              child: SizedBox(
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
      ),
    );
  }
}
