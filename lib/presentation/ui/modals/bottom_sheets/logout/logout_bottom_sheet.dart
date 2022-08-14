import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/styles/ui_helper.dart';
import '../../../../providers/core/router_provider.dart';
import '../../../../providers/home/home_provider.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/secondary_outlined_button.dart';

class LogoutBottomSheet extends ConsumerWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
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
          UIHelper.verticalSpaceMedium,
          UIHelper.verticalSpaceSmall,
          Center(
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          UIHelper.verticalSpaceMedium,
          Center(
            child: SizedBox(
              width: 193,
              child: Text(
                'Are you sure you want to logout from GenNex app ?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          UIHelper.verticalSpaceMedium,
          PrimaryButton(
            onPressed: () async {
              ref.read(appRouterProvider).pop();
              ref.read(homeProvider.notifier).logout();
            },
            text: "Logout",
          ),
          UIHelper.verticalSpaceMedium,
          SecondaryOutlinedButton(
            onPressed: () => ref.read(appRouterProvider).pop(),
            text: "Cancel",
          ),
          UIHelper.verticalSpaceMedium,
        ],
      ),
    );
  }
}
