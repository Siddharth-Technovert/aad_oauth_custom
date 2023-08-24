import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/configs/log/router_log.dart';
import '../../core/configs/theme/app_theme_dark.dart';
import '../../core/configs/theme/app_theme_light.dart';
import '../../core/router/app_router.dart';
import '../../core/utils/l10n/app_loc.dart';
import '../../data/data_service_providers.dart';
import '../providers/core/router_provider.dart';
import '../providers/core/theme_state_provider.dart';
import 'modals/snack_bar/snack_bar_factory.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    // final localLanguage = ref.watch(localLanguageProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            scaffoldMessengerKey: SnackbarFactory.scaffoldMessengerKey,
            navigatorKey: appRouter.navigatorKey,
            onGenerateRoute: appRouter.generateRoutes,
            navigatorObservers: [
              RouterLog(ref.watch(loggerServiceProvider)),
            ],
            initialRoute: ScreenRouteNames.appStartRoute,
            // locale: localLanguage,
            supportedLocales: AppLoc.supportedLocale,
            localizationsDelegates: AppLoc.delegates,
            title: "RiverPod Boilerplate",
            debugShowCheckedModeBanner: false,
            themeMode: ref.watch(themeStateProvider).mode,
            theme: AppThemeLight().theme,
            darkTheme: AppThemeDark().theme,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }
}
