// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/utils/l10n/app_loc.dart';

AppLocalizations useAppLoc() {
  final context = useContext();
  return AppLoc.of(context);
}
