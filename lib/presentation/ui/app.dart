import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/configs/router_log.dart';
import '../../core/utils/l10n/app_loc.dart';
import '../../domain/service_providers.dart';
import '../providers/core/router_provider.dart';
import '../providers/core/theme_state_provider.dart';

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
          themeMode: ref.watch(themeModeProvider),
          theme: ref.watch(themeStateProvider.notifier).lightThemeData,
          darkTheme: ref.watch(themeStateProvider.notifier).darkThemeData,
        );
      },
    );
  }
}
