import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/configs/theme/app_theme_dark.dart';
import '../../core/configs/theme/app_theme_light.dart';
import '../../core/router/app_router.dart';
import '../../core/router/log/router_log.dart';
import '../../core/utils/l10n/app_loc.dart';
import '../../data/data_service_providers.dart';
import '../../domain/states/core/app_state.dart';
import '../../domain/states/core/theme_state.dart';
import '../providers/core/app_state_provider.dart';
import '../providers/core/connectivity_provider.dart';
import '../providers/core/language_provider.dart';
import '../providers/core/router_provider.dart';
import '../providers/core/theme_state_provider.dart';
import 'modals/snack_bar/snack_bar_factory.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await ref.read(connectivityServiceProvider).checkConnectivity();
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);
    final localLanguage = ref.watch(languageNotifierProvider);
    final themeState = ref.watch(themeStateNotifierProvider);
    ref.watch(connectivityStatusProvider);
    ref.watch(appStateNotifierProvider);

    ref.listen(appStateNotifierProvider, (previousVal, newVal) {
      switch (newVal) {
        case AppStateOnboarding():
          ref.read(appRouterProvider).replaceAll([const OnboardingRoute()]);
        case AppStateUnAuthenticated():
          ref.read(appRouterProvider).replaceAll([const LoginRoute()]);
        case AppStateAuthenticated():
          ref.read(appRouterProvider).replaceAll([const LandingRoute()]);
        default:
          break;
      }
    });

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
          return MaterialApp.router(
            scaffoldMessengerKey: SnackbarFactory.scaffoldMessengerKey,
            routerConfig: appRouter.config(
              navigatorObservers: () => [
                RouterLog(ref.watch(loggerServiceProvider)),
              ],
            ),
            // navigatorKey: appRouter.navigatorKey,
            // onGenerateRoute: appRouter.generateRoutes,
            // navigatorObservers: [
            //   RouterLog(ref.watch(loggerServiceProvider)),
            // ],
            // initialRoute: ScreenRouteNames.appStartRoute,
            locale: localLanguage,
            supportedLocales: AppLoc.supportedLocale,
            localizationsDelegates: AppLoc.delegates,
            title: "RiverPod Boilerplate",
            debugShowCheckedModeBanner: false,
            themeMode: themeState.mode,
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
