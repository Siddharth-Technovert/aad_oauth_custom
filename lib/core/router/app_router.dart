import 'package:auto_route/auto_route.dart';

import '../../app/presentation/screens/app_start_screen.dart';
import '../../feature/home/presentation/modals/bottom_sheets/logout/logout_bottom_sheet.dart';
import '../../shared/presentation/ui/modals/bottom_sheets/bottom_sheet_factory.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AppStartScreen, initial: true),
    CustomRoute(
      name: 'LogoutBottomSheetRoute',
      page: LogoutBottomSheet,
      customRouteBuilder: BottomSheetFactory.modalSheetBuilder,
    ),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
class $AppRouter {}
