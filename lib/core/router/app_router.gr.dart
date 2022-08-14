// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/ui/modals/bottom_sheets/bottom_sheet_factory.dart'
    as _i5;
import '../../presentation/ui/modals/bottom_sheets/logout/logout_bottom_sheet.dart'
    as _i2;
import '../../presentation/ui/screens/app_start_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppStartScreen());
    },
    LogoutBottomSheetRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LogoutBottomSheet(),
          customRouteBuilder: _i5.BottomSheetFactory.modalSheetBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(AppStartRoute.name, path: '/'),
        _i3.RouteConfig(LogoutBottomSheetRoute.name,
            path: '/logout-bottom-sheet'),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.AppStartScreen]
class AppStartRoute extends _i3.PageRouteInfo<void> {
  const AppStartRoute() : super(AppStartRoute.name, path: '/');

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.LogoutBottomSheet]
class LogoutBottomSheetRoute extends _i3.PageRouteInfo<void> {
  const LogoutBottomSheetRoute()
      : super(LogoutBottomSheetRoute.name, path: '/logout-bottom-sheet');

  static const String name = 'LogoutBottomSheetRoute';
}
