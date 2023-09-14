import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../domain/states/core/theme_state.dart';
import '../../../../../providers/core/router_provider.dart';
import '../../../../../providers/core/theme_state_provider.dart';
import '../../../../widgets/custom_text.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        UIDimensions.padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CustomText.headlineLarge(context.appLoc.settings),
        ),
        Consumer(builder: (context, ref, child) {
          final selectedThemeState = ref.watch(themeStateNotifierProvider);
          return SwitchListTile.adaptive(
            contentPadding:
                UIDimensions.symmetricPaddingGeometry(horizontal: 16),
            title: CustomText.bodyMedium(
              context.appLoc.switchTheme,
            ),
            value: selectedThemeState == const ThemeStateDark(),
            onChanged: (val) async =>
                ref.read(themeStateNotifierProvider.notifier).setThemeState(
                      val ? const ThemeStateDark() : const ThemeStateLight(),
                    ),
          );
        }),
        ListTile(
          contentPadding: UIDimensions.symmetricPaddingGeometry(horizontal: 16),
          title: CustomText.bodyMedium(context.appLoc.languages),
          trailing: Icon(
            Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
          ),
          onTap: () {
            ref.read(appRouterProvider).push(const LanguageSelectionRoute());
          },
        ),
        ListTile(
          contentPadding: UIDimensions.symmetricPaddingGeometry(horizontal: 16),
          title: CustomText.bodyMedium(context.appLoc.logout),
          trailing: Icon(
            Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
          ),
          onTap: () async {
            // // final response =
            // //     await Dio(BaseOptions(baseUrl: AppConfiguration.baseUrl)).get(
            // //   EndPoints.topHeadlines.val(),
            // //   queryParameters: {
            // //     "country": "in",
            // //     "apiKey": AppConfiguration.apiKey,
            // //   },
            // // );
            // final response = await Dio().get(
            //   "https://dart.dev",
            // );
            // print("Received Response $response");
            ref.read(appRouterProvider).push(const LogoutBottomSheetRoute());
          },
        ),
      ],
    );
  }
}
