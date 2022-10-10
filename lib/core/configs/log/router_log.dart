import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../logger/logger_service.dart';

class RouterLog extends AutoRouterObserver {
  final LoggerService _log;
  RouterLog(this._log);

  @override
  void didPush(Route route, Route? previousRoute) {
    _log.infoLog('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log.infoLog(
      'Route popped: ${route.settings.name}, New route: ${previousRoute!.settings.name}',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _log.infoLog('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _log.infoLog('Tab route re-visited: ${route.name}');
  }
}
