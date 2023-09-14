import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/models/article/article.dart';
import '../../presentation/ui/modals/bottom_sheets/bottom_sheet_factory.dart';
import '../../presentation/ui/modals/bottom_sheets/logout/logout_bottom_sheet.dart';
import '../../presentation/ui/screens/landing/landing_screen.dart';
import '../../presentation/ui/screens/landing/screens/home/home_screen.dart';
import '../../presentation/ui/screens/landing/screens/settings/settings_screen.dart';
import '../../presentation/ui/screens/language_selection/language_selection_screen.dart';
import '../../presentation/ui/screens/login/login_screen.dart';
import '../../presentation/ui/screens/news_detail/news_detail_screen.dart';
import '../../presentation/ui/screens/onboarding/onboarding_screen.dart';
import '../../presentation/ui/screens/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: LandingRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: SettingsRoute.page)
          ],
        ),
        AutoRoute(page: NewsDetailRoute.page),
        AutoRoute(page: LanguageSelectionRoute.page),
        CustomRoute(
          page: LogoutBottomSheetRoute.page,
          customRouteBuilder: BottomSheetFactory.closeButtonModalSheetBuilder,
          fullscreenDialog: true,
        ),
      ];
}
