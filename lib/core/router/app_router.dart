import 'package:flutter/material.dart';

import '../../domain/models/article/article.dart';
import '../../presentation/ui/modals/bottom_sheets/bottom_sheet_factory.dart';
import '../../presentation/ui/modals/bottom_sheets/logout/logout_bottom_sheet.dart';
import '../../presentation/ui/screens/app_start_screen.dart';
import '../../presentation/ui/screens/language_selection/language_selection_screen.dart';
import '../../presentation/ui/screens/news_detail/news_detail_screen.dart';
import '../../presentation/ui/widgets/custom_text.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic popAndPushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.popAndPushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([
    T? result,
  ]) {
    return navigatorKey.currentState?.pop<T>(result);
  }

  //?Make sure to pass setting in material page route setting param
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouteNames.appStartRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AppStartScreen(),
        );
      case ScreenRouteNames.newsDetailRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => NewsDetailScreen(
            article: settings.arguments as Article,
          ),
        );
      case ScreenRouteNames.languageSelectionRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LanguageSelectionScreen(),
        );
      case BottomSheetRouteNames.logOutBottomSheetRoute:
        return BottomSheetFactory.closeButtonModalSheetBuilder<
            LogoutBottomSheet>(
          const LogoutBottomSheet(),
          settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: CustomText.displaySmall(
                "Not found ${settings.name}",
              ),
            ),
          ),
        );
    }
  }
}

class ScreenRouteNames {
  static const String appStartRoute = "/app_start_route";
  static const String newsDetailRoute = "/news_detail_route";
  static const String languageSelectionRoute = "/language_selection_route";
}

class BottomSheetRouteNames {
  static const String logOutBottomSheetRoute = "/logout_bottom_sheet_route";
}
