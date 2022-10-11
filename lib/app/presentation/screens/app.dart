import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/log/router_log.dart';
import '../../../core/configs/theme/app_theme.dart';
import '../../../core/utils/l10n/app_loc.dart';
import '../../../feature/service_providers.dart';
import '../../../shared/presentation/providers/router_provider.dart';
import '../../../shared/presentation/providers/theme_state_provider.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    // final localLanguage = ref.watch(localLanguageProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(
            navigatorObservers: () => [
              RouterLog(ref.watch(loggerServiceProvider)),
            ],
          ),
          // locale: localLanguage,
          supportedLocales: AppLoc.supportedLocale,
          localizationsDelegates: AppLoc.delegates,
          title: "Riverpod Boilerplate",
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(themeStateProvider).mode,
          theme: AppTheme.light.theme,
          darkTheme: AppTheme.dark.theme,
        );
      },
    );
  }
}
