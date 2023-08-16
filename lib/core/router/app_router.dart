import 'package:flutter/material.dart';

import '../../presentation/ui/modals/bottom_sheets/bottom_sheet_factory.dart';
import '../../presentation/ui/modals/bottom_sheets/logout/logout_bottom_sheet.dart';
import '../../presentation/ui/screens/app_start_screen.dart';

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

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouteNames.appStartRoute:
        return MaterialPageRoute(
          builder: (context) => const AppStartScreen(),
        );
      case BottomSheetRouteNames.logOutBottomSheetRoute:
        return BottomSheetFactory.closeButtonModalSheetBuilder<
            LogoutBottomSheet>(
          const LogoutBottomSheet(),
          settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Not found ${settings.name}"),
            ),
          ),
        );
    }
  }
}

class ScreenRouteNames {
  static const String appStartRoute = "/";
}

class BottomSheetRouteNames {
  static const String logOutBottomSheetRoute = "/logout_bottom_sheet_route";
}
