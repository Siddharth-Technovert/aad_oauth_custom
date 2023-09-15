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
import '../logger/logger_service.dart';
import '../utils/local_storage/secure/secure_storage_manager.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final SecureStorageManager _secureStorageManager;
  final LoggerService _logger;

  late final AuthGuard _authGuard = AuthGuard(_secureStorageManager, _logger);

  AppRouter(
    this._secureStorageManager,
    this._logger,
  );

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          guards: [_authGuard],
          page: LandingRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: SettingsRoute.page)
          ],
        ),
        AutoRoute(
          guards: [_authGuard],
          page: NewsDetailRoute.page,
        ),
        AutoRoute(
          guards: [_authGuard],
          page: LanguageSelectionRoute.page,
        ),
        CustomRoute(
          guards: [_authGuard],
          page: LogoutBottomSheetRoute.page,
          customRouteBuilder: BottomSheetFactory.closeButtonModalSheetBuilder,
          fullscreenDialog: true,
        ),
      ];
}
