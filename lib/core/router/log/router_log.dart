import 'package:flutter/widgets.dart';

import '../../logger/logger_service.dart';

class RouterLog extends NavigatorObserver {
  final LoggerService _log;
  RouterLog(this._log);

  @override
  void didPush(Route route, Route? previousRoute) {
    _log.infoLog('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log.infoLog(
      'Route popped: ${route.settings.name}, New route: ${previousRoute?.settings.name}',
    );
  }
}
